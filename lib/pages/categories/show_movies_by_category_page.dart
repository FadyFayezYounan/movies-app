import 'package:flutter/material.dart';
import 'package:my_movie_app/pages/home/movie_widget.dart';
import 'package:my_movie_app/providers/categories_provider.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';


class ShowMoviesByCategoryPage extends StatelessWidget {
  final String categoryName;
  final int categoryId;

  const ShowMoviesByCategoryPage({
    Key? key,
    required this.categoryName,
    required this.categoryId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$categoryName'),
      ),
      body: FutureBuilder(
        future: Provider.of<CategoriesProvider>(context,listen: false).getMoviesThatBelongToThisCategory(categoryId: categoryId),
        builder: (BuildContext context,snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          return Consumer<CategoriesProvider>(
            builder: (context, categoriesProvider, child) => GridView.builder(
              physics: BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: KAppPadding),
              itemCount: categoriesProvider.moviesBelongToCategory.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: KAppPadding,
                mainAxisSpacing: KAppPadding,
                childAspectRatio: 0.76,
              ),
              itemBuilder: (context, index) => MovieWidget(
                movie: categoriesProvider.moviesBelongToCategory[index],
              ),
            ),
          );
        },

      ),
    );
  }
}
