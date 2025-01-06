import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarTop extends StatelessWidget {
  const AppBarTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      decoration: BoxDecoration(
        color: Color(0xFFFFF1F4),
      ),
      child:  SvgPicture.asset(
              'assets/appbar.svg', // Replace with your SVG asset path
              fit: BoxFit.cover, // Ensures the SVG covers the entire container
      ),
    );
  }
}
