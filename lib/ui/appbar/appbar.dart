import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget {

  final double barHeight = 66.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: barHeight,
      decoration: BoxDecoration(color: Colors.blue),
      child: Center(
        child: Text(
          '길을 찾자',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Nanum',
            fontWeight: FontWeight.w600,
            fontSize: 36.0
          ),
        ),
      ),
    );
  }
}