import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../helpers/routes.dart' as route;
import '../themes/app_colors.dart' as color;
import '../widgets/article_grid.dart';

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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, route.cameraScreen),
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
          SearchWidget(
            context: context,
            isPlaceMode: _isPlaceMode,
          ),
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
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: GestureDetector(
          onTap: () => showSearch(
            context: context,
            delegate: Search(),
          ),
          child: Container(
            height: 7.h,
            width: 90.w,
            color: color.kcGrayColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    _isPlaceMode
                        ? 'Search for a place'
                        : 'Search for an article',
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  ),
                ),
              const  Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
