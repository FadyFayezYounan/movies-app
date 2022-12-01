import 'package:flutter/material.dart';
import 'package:my_movie_app/pages/categories/category_widget.dart';
import 'package:my_movie_app/providers/categories_provider.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: Consumer<CategoriesProvider>(
        builder: (context, categoriesProvider, child) => GridView.builder(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: KAppPadding),
          itemCount: categoriesProvider.categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: KAppPadding/2,
            mainAxisSpacing: KAppPadding/2,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) => CategoryWidget(
            categoryModel: categoriesProvider.categories[index],
          ),
        ),
      ),
    );
  }
}
