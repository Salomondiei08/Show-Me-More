import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:provider/provider.dart';
import 'package:show_me_more/providers/articles_provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../models/article.dart';
import '../providers/places_provider.dart';
import '../themes/app_colors.dart' as color;
import '../widgets/article_grid.dart';
import '../widgets/box_element.dart';
import '../widgets/category_widget.dart';
import '../widgets/place_grid.dart';
import '../widgets/rounded_bottom_bar.dart';
import '../widgets/search.dart';
import 'info_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget _pageSelector(int index) {
    switch (index) {
      case 0:
        return buildBody();
      case 1:
        return const InfoScreen();
      default:
        return buildBody();
    }
  }

  int _selectedPage = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  bool _isPlaceMode = true;

  void setPlaceMode() {
    setState(() {
      _isPlaceMode = true;
    });
  }

  void setArticleMode() {
    setState(() {
      _isPlaceMode = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: color.kcPrimaryColor,
      body: SafeArea(
        child: Stack(
          
          children: [
            _pageSelector(_selectedPage),
            FloatingSearchWidget(context: context),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: _isPlaceMode ? color.kcGreenColor : color.kcOrange,
        child: const Icon(
          Icons.view_in_ar,
          color: color.kcGrayColor,
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: RoundedBottomBar(
        selectPage: _selectPage,
        selectedPage: _selectedPage,
      ),
    );
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 3.h),
          Text(
            'Welcome on',
            style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: _isPlaceMode ? color.kcGreenColor : color.kcOrange),
          ),
          SizedBox(height: 1.3.h),
          RichText(
            text: TextSpan(
              style: TextStyle(
                  fontSize: 25.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              children: [
                const TextSpan(
                  text: 'SHOW ME ',
                ),
                TextSpan(
                  text: 'MORE',
                  style: TextStyle(
                      color: _isPlaceMode ? color.kcGreenColor : color.kcOrange,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 2.h),
          SizedBox(height: 2.h),
          Expanded(
            child: SizedBox(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CategoryWidget(
                    onPressed: setPlaceMode,
                    icon: Icons.business,
                    text: 'Places',
                    active: _isPlaceMode,
                    buttonColor: color.kcGreenColor,
                  ),
                  SizedBox(
                    width: 1.5.w,
                  ),
                  CategoryWidget(
                    onPressed: setArticleMode,
                    icon: Icons.shopping_cart,
                    text: 'Articles',
                    active: !_isPlaceMode,
                    buttonColor: color.kcOrange,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            'LE PLUS POPULAIRES',
            style: TextStyle(
                fontSize: 20.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 3.h),
          Expanded(
            flex: 3,
            child: SizedBox(
              height: 50.h,
              child: _isPlaceMode ? const PlaceGrid() : const ArticleGrid(),
            ),
          ),
        ],
      ),
    );
  }
}

class FloatingSearchWidget extends StatelessWidget {
  const FloatingSearchWidget({
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return FloatingSearchBar(
      hint: 'Search a place...',
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
        // Call your model, bloc, controller here.
      },
      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(height: 112, color: Colors.amber),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
    required this.context,
    required bool isPlaceMode,
  })  : _isPlaceMode = isPlaceMode,
        super(key: key);

  final BuildContext context;
  final bool _isPlaceMode;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: IconButton(
            color: Colors.white,
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: Search(),
              );
            },
          ),
          filled: true,
          fillColor: color.kcGrayColor,
          hintText:
              _isPlaceMode ? "Serch for a Place..." : "Search for an artcle...",
          hintStyle: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
