import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_app/common_widgets/app_indicator.dart';
import 'package:my_movie_app/pages/home/movie_banner_widget.dart';
import 'package:my_movie_app/pages/see_more_movies/see_more_movies_page.dart';
import 'package:my_movie_app/providers/now_playing_movies_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class MoviesBannersCarouselSliderWidget extends StatelessWidget {
  const MoviesBannersCarouselSliderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      future:
      Provider.of<NowPlayingMoviesProvider>(context, listen: false)
          .fetchAndSetNowPlayingMovies(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            height: 40.h,
            child: Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasError == true) {
          return Center(
            child: Column(
              children: [
                Text('An error occurred!!'),
                Text('${snapshot.error}'),
              ],
            ),
          );
        }
        return Consumer<NowPlayingMoviesProvider>(
          builder: (context, nowPlayingMoviesProvider, child) {
            final nowPlayingMoviesList =
                nowPlayingMoviesProvider.nowPlayingMovies;
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CarouselSlider.builder(
                  //carouselController: _carouselController,
                  itemCount:
                  nowPlayingMoviesProvider.nowPlayingMoviesLength,
                  itemBuilder: (BuildContext context, int itemIndex,
                      int pageViewIndex) =>
                      MovieBannerWidget(
                        movie: nowPlayingMoviesList[itemIndex],
                      ),
                  options: CarouselOptions(
                    height: 40.h,
                    viewportFraction: 1.0,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration:
                    Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      nowPlayingMoviesProvider.changeCurrentIndex(index);
                      //print('------------------------------->${nowPlayingMoviesProvider.currentIndex}');
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                Positioned(
                  top: 0.0,
                  right: 8.0,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SeeMoreMoviesPage(
                            movies: nowPlayingMoviesList,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'see more +${nowPlayingMoviesList.length - (nowPlayingMoviesProvider.nowPlayingMoviesLength)}',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      shape: StadiumBorder(),
                      primary: Colors.black54,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppIndicator(
                    numberOfDots: 5,
                    currentIndex: nowPlayingMoviesProvider.currentIndex,

                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
