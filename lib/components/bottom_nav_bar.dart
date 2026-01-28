import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int)? onTabChange;

  const MyBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: GNav(
          selectedIndex: currentIndex,
          color: Colors.grey[400],
          activeColor: Colors.grey.shade700,
          tabActiveBorder: Border.all(color: Colors.white),
          tabBackgroundColor: Colors.grey.shade100,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          tabBorderRadius: 16,
          gap: 8,
          onTabChange: (value) => onTabChange!(value),
          tabs: const [
            GButton(
              icon: Icons.storefront_outlined,
              text: "Магазин",
            ),
            GButton(
              icon: Icons.favorite_border,
              text: "Избранное",
            ),
            GButton(
              icon: Icons.shopping_bag_rounded,
              text: "Корзина",
            ),
            GButton(
              icon: Icons.person_outline,
              text: "Профиль",
            ),
          ]),
    );
  }
}
