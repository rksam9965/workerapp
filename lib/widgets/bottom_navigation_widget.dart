import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';  // Import flutter_svg
import '../pages/worker_page/worker_page.dart';  // Adjust import paths as necessary

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),  // Replace with your actual pages
    Center(child: Text("Add")),
    Center(child: Text("Add Worker")),
    Center(child: Text("Profile")),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (currentIndex != 0) {
          onTabTapped(0);
          return false;
        } else {
          return true;
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: _pages[currentIndex],
          bottomNavigationBar: Container(
            height: 65,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.black,
                  width: 0.0,
                ),
              ),
              color: Color(0xFF70281f),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                  child: navItem(
                    svgIcon('assets/home.svg', 26, 0),
                        () => onTabTapped(0),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                  child: navItem(
                    svgIcon('assets/plus.svg', 26, 1),
                        () => onTabTapped(1),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                  child: navItem(
                    svgIcon('assets/message.svg', 26, 2),
                        () => onTabTapped(2),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: navItem(
                    svgIcon('assets/person.svg', 26, 3),
                        () => onTabTapped(3),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to build SVG icons with active color logic based on index
  Widget svgIcon(String assetPath, double size, int pageIndex) {
    return SvgPicture.asset(
      assetPath,
      width: size,
      height: size,
      color: currentIndex == pageIndex ? Colors.white : Colors.grey,
    );
  }

  Widget navItem(Widget icon, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 35,
            child: Center(
              child: icon,
            ),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
