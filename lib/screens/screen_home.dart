// ignore_for_file: prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:task12/screens/screen_product_details.dart';
import 'package:task12/screens/sub_screen_home_bookmarks.dart';
import 'package:task12/screens/sub_screen_home_main.dart';
import 'package:task12/utils/app_colors.dart';

class ScreenHome extends StatefulWidget {
  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

/// Bottom Nav Bar
/// https://m2.material.io/components/bottom-navigation/flutter#theming-a-bottom-nav-bar
class _ScreenHomeState extends State<ScreenHome> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.search),
        actions: [
          Icon(Icons.shopping_cart),
          SizedBox(width: 16,)
        ],
        title: Center(
          child: Column(
            children: [
              Text(
                'Make home',
                style: TextStyle(
                  color: AppColors.secondaryText,
                ),
              ),
              Text(
                'BEAUTIFUL',
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontSize: 27,
                ),
              ),
            ],
          ),
        ),
      ),
      body: _getBody(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: AppColors.primaryText,
        unselectedItemColor: AppColors.secondaryText,
        elevation: 3,
        iconSize: 28,
        currentIndex: _currentIndex,
        onTap: (value) {
          if (value == 0 || value == 1) {
            setState(() => _currentIndex = value);
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outline),
            label: 'Bookmarks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ]
      ),
    );
  }

  Widget _getBody() {
    if (_currentIndex == 0) {
      return SubScreenHomeMain(() => ScreenProductDetails());
    }else if (_currentIndex == 1) {
      return SubScreenHomeBookmarks();
    }else {
      return Placeholder();
    }
  }

}

