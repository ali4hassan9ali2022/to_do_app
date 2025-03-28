import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });
  final int currentIndex;
  final Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: onTap,
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
