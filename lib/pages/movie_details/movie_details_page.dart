import 'package:flutter/material.dart';

import 'package:my_movie_app/common_widgets/app_cached_network_image.dart';
import 'package:my_movie_app/common_widgets/app_expandable_text.dart';
import 'package:my_movie_app/common_widgets/app_icon.dart';
import 'package:my_movie_app/common_widgets/app_icon_button.dart';
import 'package:my_movie_app/common_widgets/app_sized_box.dart';
import 'package:my_movie_app/common_widgets/movie_poster_place_holder_widget.dart';
import 'package:my_movie_app/common_widgets/movies_collection_widget.dart';
import 'package:my_movie_app/constants.dart';
import 'package:my_movie_app/models/movie_model.dart';
import 'package:my_movie_app/models/movies_details_model.dart';
import 'package:my_movie_app/pages/movie_details/cast_collection_widget.dart';
import 'package:my_movie_app/pages/movie_details/more_info_widget.dart';
import 'package:my_movie_app/pages/movie_details/movie_genres.dart';
import 'package:my_movie_app/providers/movies_details_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'movie_cover_image.dart';
import 'movie_three_info_widget.dart';

class MovieDetailsPage extends StatefulWidget {
  final Movie movie;

  const MovieDetailsPage({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  //late YoutubePlayerController _controller;
  late TextEditingController _seekToController;

  // late PlayerState _playerState;
  // late YoutubeMetaData _videoMetaData;
  // double _volume = 100;
  // bool _muted = false;
  //bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    //_controller = YoutubePlayerController(initialVideoId: 'jRn48HxssPI');
    // _controller = YoutubePlayerController(
    //   initialVideoId: 'jRn48HxssPI',
    //   flags: const YoutubePlayerFlags(
    //     mute: false,
    //     autoPlay: false,
    //     disableDragSeek: false,
    //     loop: true,
    //     isLive: false,
    //     forceHD: false,
    //     enableCaption: true,
    //     //captionLanguage: 'en'
    //   ),
    // )..addListener(listener);
    _seekToController = TextEditingController();
    // _videoMetaData = const YoutubeMetaData();
    // _playerState = PlayerState.unknown;
  }

  // void listener() {
  //   if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
  //     setState(() {
  //       // _playerState = _controller.value.playerState;
  //       // _videoMetaData = _controller.metadata;
  //     });
  //   }
  // }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    //_controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    //_controller.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: Provider.of<MoviesDetailsProvider>(context, listen: false)
              .getMovieDetails(movieId: widget.movie.id!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    AppHSizedBox(),
                    Text('Loading...'),
                  ],
                ),
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
            return Consumer<MoviesDetailsProvider>(
              builder: (context, moviesDetailsProvider, child) {
                final movieDetails = moviesDetailsProvider.movieDetails;
                return YoutubePlayerBuilder(
                  player: buildYoutubePlayer(
                      context, moviesDetailsProvider.getMovieTrailer),
                  //'bVnoFtZH5iI'
                  builder: (context, youtubePlayer) => CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        expandedHeight: 30.h,
                        pinned: true,
                        leading: AppIconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          iconName: IconName.arrowLeftCircle,
                        ),
                        automaticallyImplyLeading: false,
                        flexibleSpace: widget.movie.backdropPath != null
                            ? MovieCoverImage(
                                movieCoverPath: widget.movie.backdropPath!,
                                movieTitle:
                                    '${widget.movie.title} (${widget.movie.releaseDate!.substring(0, 4)})',
                              )
                            : MovieWithOutCoverImageWidget(
                                movieTitle: '${widget.movie.title}',
                                movieReleaseDate: '${widget.movie.releaseDate}',
                              ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(KAppPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildMovieImageAndGenresAndOverViewWidget(
                                  movieDetails),
                              Divider(
                                color: Colors.grey.withOpacity(0.3),
                              ),
                              AppHSizedBox(),
                              MovieThreeInfo(
                                movieRate: movieDetails.voteAverage!,
                                movieTime: movieDetails.runtime!,
                                movieLanguage:
                                    movieDetails.spokenLanguages!.length != 0
                                        ? movieDetails
                                            .spokenLanguages![0].englishName!
                                        : '',
                              ),
                              AppHSizedBox(),
                              Divider(
                                color: Colors.grey.withOpacity(0.3),
                                height: 16,
                              ),
                              Text(
                                'Movie Trailer:',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              AppHSizedBox(),
                              moviesDetailsProvider.getMovieTrailer != ''
                                  ? youtubePlayer
                                  : const Center(
                                      child: Text(
                                          'No available trailer for this movie.'),
                                    ),
                              Divider(
                                color: Colors.grey.withOpacity(0.3),
                                height: 16,
                              ),
                              if (moviesDetailsProvider.moreMoviesLikeThisMovie.length != 0)
                                MoviesCollectionWidget(
                                  movies: moviesDetailsProvider
                                      .moreMoviesLikeThisMovie,
                                  title: 'More like this',
                                  titleColor: Colors.white,
                                  showLeading: true,
                                ),
                              if (moviesDetailsProvider.movieCast.length != 0)
                                CastCollectionWidget(
                                  cast: moviesDetailsProvider.movieCast,
                                  title: 'Top Billed Cast',
                                  titleColor: Colors.white,
                                  showLeading: true,
                                ),
                              Divider(
                                color: Colors.grey.withOpacity(0.3),
                                height: 16,
                              ),
                              buildMovieMoreInfo(
                                movieDetails,
                                moviesDetailsProvider,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }),
    );
  }

  YoutubePlayer buildYoutubePlayer(context, String movieTrailer) {
    return YoutubePlayer(
      controller: YoutubePlayerController(
        initialVideoId: movieTrailer,
        flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: false,
          disableDragSeek: false,
          loop: true,
          isLive: false,
          forceHD: false,
          enableCaption: true,
          //captionLanguage: 'en'
        ),
      ),
      //showVideoProgressIndicator: true,
      bottomActions: [
        CurrentPosition(),
        const SizedBox(width: 10.0),
        ProgressBar(
          isExpanded: true,
          colors: ProgressBarColors(
            playedColor: Theme.of(context).primaryColor,
            handleColor: Theme.of(context).primaryColor,
            // backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
            // bufferedColor: Theme.of(context).primaryColor.withOpacity(0.5),
          ),
        ),
        const SizedBox(width: 10.0),
        RemainingDuration(),
        FullScreenButton(),
      ],
      onReady: () {
        //_controller.addListener(listener);
      },
    );
  }

  Widget buildMovieImageAndGenresAndOverViewWidget(MovieDetails movieDetails) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: movieDetails.posterPath != null
              ? AppCachedNetworkImage(
                  borderRadius: 4.0,
                  imageUrl:
                      'https://image.tmdb.org/t/p/w500/${movieDetails.posterPath}',
                )
              : MoviePosterPlaceHolderWidget(),
          flex: 1,
        ),
        SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: Column(
            children: [
              SizedBox(
                height: 36.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: movieDetails.genres!
                      .map(
                        (genres) => MovieGenres(
                          text: genres.name!,
                          id: genres.id!,
                        ),
                      )
                      .toList(),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              AppExpandableText(
                text: widget.movie.overview!,
                maxLines: 8,
              ),
            ],
          ),
          flex: 2,
        ),
      ],
    );
  }

  Widget buildMovieMoreInfo(movieDetails, moviesDetailsProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'More Information:',
          style: Theme.of(context).textTheme.headline5,
        ),
        MoreInfoWidget(
          text: 'Movie Status',
          value: '${movieDetails.status}',
          icon: movieDetails.status == 'Released'
              ? Icons.check_circle_rounded
              : Icons.cancel_rounded,
        ),
        if (moviesDetailsProvider.getMovieBudget != '0')
          MoreInfoWidget(
            text: 'Movie Budget',
            value: '${moviesDetailsProvider.getMovieBudget}',
            icon: Icons.paid_rounded,
          ),
        if (moviesDetailsProvider.getMovieRevenue != '0')
          MoreInfoWidget(
            text: 'Movie Revenue',
            value: '${moviesDetailsProvider.getMovieRevenue}',
            icon: Icons.paid_rounded,
          ),
        MoreInfoWidget(
          text: 'Movie Release Date',
          value: '${movieDetails.releaseDate}',
          icon: Icons.watch_later_rounded,
        ),
        MoreInfoWidget(
          text: 'Movie Vote Count',
          value: '${moviesDetailsProvider.getMovieVoteCount}',
          icon: Icons.pin_rounded,
        ),
        MoreInfoWidget(
          text: 'Movie Original Language',
          value: '${movieDetails.originalLanguage}',
          icon: Icons.language_rounded,
        ),
      ],
    );
  }
}

class MovieWithOutCoverImageWidget extends StatelessWidget {
  final String movieTitle;
  final String? movieReleaseDate;

  const MovieWithOutCoverImageWidget({
    Key? key,
    required this.movieTitle,
    required this.movieReleaseDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Center(
        child: Text(
          'No cover image for this movie!!',
        ),
      ),
      title: Text(
        movieReleaseDate != ''
            ? '$movieTitle (${movieReleaseDate!.substring(0, 4)})'
            : '$movieTitle',
        style: TextStyle(color: Colors.white),
        textScaleFactor: 0.8,
      ),
    );
  }
}

//Consumer<PopularMoviesProvider>(
//                 builder: (context, popularMoviesProvider, child) {
//               final movieDetails = popularMoviesProvider.movieDetails;
//               return SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     //Text('${movieDetails.runtime} min'),
//                     AppCachedNetworkImage(
//
//                       imageUrl:
//                       'https://image.tmdb.org/t/p/w500/${movieDetails.backdropPath}',
//                       boxFit: BoxFit.cover,
//                     )
//                   ],
//                 ),
//               );
//             })
