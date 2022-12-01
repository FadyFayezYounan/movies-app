import 'package:flutter/material.dart';
import 'package:my_movie_app/common_widgets/go_to_page.dart';
import 'package:my_movie_app/models/categories_model.dart';
import 'package:my_movie_app/pages/categories/show_movies_by_category_page.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryModel categoryModel;

  const CategoryWidget({
    Key? key,
    required this.categoryModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        goToThisPage(
          context,
          ShowMoviesByCategoryPage(
            categoryName: categoryModel.name!,
            categoryId:  categoryModel.id!,
          ),
        );
      },
      child: Text(
        categoryModel.name!,
        style: Theme.of(context).textTheme.subtitle1,
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(4.0),
        primary: Color(0xFF2A2A2A),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class CategoryWidget extends StatelessWidget {
//   final String categoryName;
//
//   const CategoryWidget({
//     Key? key,
//     required this.categoryName,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: (){},
//       child: Material(
//         color: Colors.transparent,
//         child: Container(
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//             color: Color(0xFF2A2A2A),
//             borderRadius: BorderRadius.circular(4.0),
//           ),
//           child: Text(
//             '$categoryName',
//             style: Theme.of(context).textTheme.subtitle1,
//           ),
//         ),
//       ),
//     );
//   }
// }
