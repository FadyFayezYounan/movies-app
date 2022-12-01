import 'package:flutter/material.dart';
import 'package:my_movie_app/providers/bottom_nav_bar_Provider.dart';
import 'package:provider/provider.dart';

class AppBottomNavigatorBar extends StatelessWidget {
  const AppBottomNavigatorBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavBarProvider>(
      builder: (context, bottomNavBarProvider, child) => BottomNavigationBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        currentIndex: bottomNavBarProvider.currentIndex,
        onTap: (index) {
          bottomNavBarProvider.changeCurrentIndexValue(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.grid_view_rounded,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
