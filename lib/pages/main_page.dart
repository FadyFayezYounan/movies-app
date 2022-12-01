import 'package:flutter/material.dart';
import 'package:my_movie_app/common_widgets/app_bottom_nav_bar.dart';
import 'package:my_movie_app/pages/home/home_page.dart';
import 'package:my_movie_app/pages/profile/profile_page.dart';
import 'package:my_movie_app/providers/bottom_nav_bar_Provider.dart';
import 'package:provider/provider.dart';

import 'categories/categories_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> pages = [
    HomePage(),
    CategoriesPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: Provider.of<BottomNavBarProvider>(context).currentIndex,
        children: pages,
      ),
      bottomNavigationBar: AppBottomNavigatorBar(),
    );
  }
}
