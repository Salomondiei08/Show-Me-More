import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import '../themes/app_colors.dart' as color;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedPage = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: color.kcPrimaryColor,
      body: SafeArea(
        child: buildBody(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: color.kcGreenColor,
        child: const Icon(
          CupertinoIcons.camera_viewfinder,
          color: color.kcGrayColor,
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          currentIndex: _selectedPage,
          onTap: _selectPage,
          type: BottomNavigationBarType.fixed,
          backgroundColor: color.kcGrayColor,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
              activeIcon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_alt_circle),
              label: 'Profile',
              activeIcon: Icon(CupertinoIcons.person_alt_circle_fill),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildFloatingSearchBar(BuildContext context) {
  final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

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
            children: [Container(height: 112, color: Colors.amber),],
          ),
        ),
      );
    },
  );
}

Widget buildBody() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 18.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 18),
         Text(
          'Bienvenue sur',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: color.kcOrange),
        ),
        const SizedBox(height: 20),
        RichText(
          text: const TextSpan(
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: 'SHOW ME ',
              ),
              TextSpan(
                text: 'MORE',
                style: TextStyle(
                    color: color.kcOrange, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: const TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              filled: true,
              fillColor: color.kcGrayColor,
              hintText: "Search for an artcle...",
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 95,
          child: Row(
            children: const [
              CategoryWidget(
                icon: Icons.shopping_cart,
                text: 'Articles',
              ),
              SizedBox(
                width: 15,
              ),
              CategoryWidget(
                icon: Icons.business,
                text: 'Places',
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        const Text(
          'LE PLUS POPULAIRES',
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        SizedBox(
          height: 360,
          child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              children: [
                Container(
                  height: 90,
                   color: Colors.green,
                 decoration: BoxDecoration(
borderRadius: BorderRadius.circular(20)
                 ),
                ),
                Container(
                  height: 90,
                  color: Colors.green,
                ),
                Container(
                  height: 90,
                  color: Colors.blue,
                ),
                Container(
                  height: 90,
                  color: Colors.orange,
                ),
                Container(
                  height: 90,
                  color: Colors.white,
                ),
                Container(
                  height: 90,
                  color: Colors.pink,
                ),
                SizedBox(height: 5),
                Container(
                  height: 90,
                  color: Colors.amber,
                ),
                SizedBox(height: 5),
              ]),
        )
      ],
    ),
  );
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: color.kcGrayColor,
            borderRadius: BorderRadius.circular(12),
          ),
          height: 70,
          width: 154,
          child: Icon(
            icon,
            color: Colors.white,
            size: 45,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          child: Center(
              child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 15),
          )),
          height: 15,
          width: 154,
        ),
      ],
    );
  }
}
