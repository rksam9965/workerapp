import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';  // Import flutter_svg
import '../pages/worker_page/worker_page.dart';  // Adjust import paths as necessary

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

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
        if (_currentIndex != 0) {
          _onTabTapped(0);
          return false;
        } else {
          return true;
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: _pages[_currentIndex],
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
                  child: _buildNavItem(
                    _buildSvgIcon('assets/home.svg', 26, 0),
                        () => _onTabTapped(0),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                  child: _buildNavItem(
                    _buildSvgIcon('assets/plus.svg', 26, 1),
                        () => _onTabTapped(1),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                  child: _buildNavItem(
                    _buildSvgIcon('assets/message.svg', 26, 2),
                        () => _onTabTapped(2),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: _buildNavItem(
                    _buildSvgIcon('assets/person.svg', 26, 3),
                        () => _onTabTapped(3),
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
  Widget _buildSvgIcon(String assetPath, double size, int pageIndex) {
    return SvgPicture.asset(
      assetPath,
      width: size,
      height: size,
      color: _currentIndex == pageIndex ? Colors.white : Colors.grey,
    );
  }

  Widget _buildNavItem(Widget icon, Function() onTap) {
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

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
