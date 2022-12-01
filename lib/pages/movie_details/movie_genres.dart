

import 'package:flutter/material.dart';
import 'package:my_movie_app/common_widgets/go_to_page.dart';
import 'package:my_movie_app/pages/categories/show_movies_by_category_page.dart';

class MovieGenres extends StatelessWidget {
  final String text;
  final int id;

  const MovieGenres({
    Key? key,
    required this.text,
    required this.id
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: OutlinedButton(
        onPressed: () {
          goToThisPage(
            context,
            ShowMoviesByCategoryPage(
              categoryName: text,
              categoryId:  id,
            ),
          );
        },
        child: Text('$text'),
        style: OutlinedButton.styleFrom(
          primary: Theme.of(context).accentColor,
          side: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}