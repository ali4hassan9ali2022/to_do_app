import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key, required this.currentIndex});
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      items: [
        const BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Tasks"),
        const BottomNavigationBarItem(
          icon: Icon(Icons.check_circle_outline),
          label: "Done",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.archive),
          label: "archived",
        ),
      ],
    );
  }
}
