import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_movie_app/common_widgets/app_sized_box.dart';
import 'package:sizer/sizer.dart';

class NoInternetPage extends StatelessWidget {
  final VoidCallback tryAgainOnPressed;

  const NoInternetPage({
    Key? key,
    required this.tryAgainOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/no_connection.svg',
              width: 50.w,
              height: 50.w,
            ),
            AppHSizedBox(),
            Text(
              'Check Your Internet Connection!!',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            AppHSizedBox(),
            ElevatedButton(
              onPressed: tryAgainOnPressed,
              child: Text(
                'try again',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
