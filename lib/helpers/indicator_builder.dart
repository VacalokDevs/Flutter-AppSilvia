import 'package:flutter/material.dart';

class IndicatorBuilder {
  static List<Widget> buildIndicator(int currentIndex, int totalItems) {
    return List<Widget>.generate(totalItems, (int index) {
      final isActive = currentIndex == index;
      return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: isActive ? 14 : 9,
        height: isActive ? 14 : 9,
        margin: EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? Colors.white : Colors.grey,
        ),
      );
    });
  }
}
