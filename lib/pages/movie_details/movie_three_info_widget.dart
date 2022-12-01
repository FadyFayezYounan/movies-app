import 'package:flutter/material.dart';

class MovieThreeInfo extends StatelessWidget {
  final double movieRate;
  final int movieTime;
  final String movieLanguage;

  const MovieThreeInfo({
    Key? key,
    required this.movieRate,
    required this.movieTime,
    required this.movieLanguage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int hours = (movieTime~/60).toInt();
    int min = (movieTime - (hours * 60));

    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildMovieRatingTimeLanguageWidget(
            context: context,
            text: 'Language',
            value: '$movieLanguage',
            icon: Icons.translate_rounded,
            iconColor: Colors.teal,
          ),
          buildVerticalDivider(),
          buildMovieRatingTimeLanguageWidget(
            context: context,
            text: 'Rating',
            value: movieRate.toString(),
            icon: Icons.star_rate_rounded,
            iconColor: Colors.yellowAccent,
            show10Rating: true,
          ),
          buildVerticalDivider(),
          buildMovieRatingTimeLanguageWidget(
            context: context,
            text: 'Time',
            value: '$hours h $min m',
            icon: Icons.schedule_rounded,
            iconColor: Colors.indigo,
          ),
        ],
      ),
    );
  }

  Padding buildVerticalDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: VerticalDivider(
        color: Colors.grey.withOpacity(0.5),
      ),
    );
  }

  Widget buildMovieRatingTimeLanguageWidget({
    required BuildContext context,
    required String text,
    required String value,
    required IconData icon,
    Color? iconColor,
    bool show10Rating = false,
  }) {
    return Column(
      children: [
        Text(
          '$text',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const SizedBox(
          height: 4.0,
        ),
        Row(
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 16,
            ),
            Text(
              ' $value',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            if (show10Rating == true)
              Text(
                '/10',
              ),
          ],
        ),
      ],
    );
  }
}
