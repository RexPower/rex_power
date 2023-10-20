import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rexpower/constants/colors.dart';
import 'package:rexpower/routing/router.dart';

class GlobalBottomNav extends StatefulWidget {
  const GlobalBottomNav({super.key});

  @override
  State<GlobalBottomNav> createState() => _GlobalBottomNavState();
}

class _GlobalBottomNavState extends State<GlobalBottomNav> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      enableFeedback: true,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      backgroundColor: primaryColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      currentIndex: currentIndex,
      onTap: (index) {
        String path = RouteNames.home;

        switch (index) {
          case 0:
            path = RouteNames.home;
            break;
          case 1:
            path = RouteNames.marketplace;
            break;
          case 2:
            path = RouteNames.helpDesk;
            break;
          case 3:
            path = RouteNames.profile;
            break;
        }

        context.go(path);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          tooltip: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shop_2_outlined),
          label: 'marketplace',
          tooltip: 'marketplace',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.help_center),
          label: 'Help Dek',
          tooltip: 'Help Dek',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
          tooltip: 'Profile',
        ),
      ],
    );
  }
}
