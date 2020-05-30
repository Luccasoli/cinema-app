import 'package:cinema_app/models/genres.dart';
import 'package:cinema_app/models/movie.dart';
import 'package:cinema_app/models/movie_details_model.dart';
import 'package:cinema_app/services/api.dart';
import 'package:cinema_app/src/widgets/genre_list_chips_widget.dart';
import 'package:cinema_app/src/widgets/movie_title_and_release_date_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HeaderMovieDetailsScreenWidget extends StatefulWidget {
  const HeaderMovieDetailsScreenWidget({
    Key key,
    @required this.movie,
    @required this.genresList,
  }) : super(key: key);

  final List<Genres> genresList;
  final Movie movie;

  @override
  _HeaderMovieDetailsScreenWidgetState createState() =>
      _HeaderMovieDetailsScreenWidgetState();
}

class _HeaderMovieDetailsScreenWidgetState
    extends State<HeaderMovieDetailsScreenWidget> {
  Future<MovieDetailsModel> movieDetailed;
  YoutubePlayerController _youtubeController;
  bool playTrailer = false;

  @override
  void initState() {
    super.initState();

    api.getMovie(widget.movie.id).then((value) {
      setState(() {
        movieDetailed = Future.value(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final fontSize = MediaQuery.of(context).size.width * 0.07;
    final size = MediaQuery.of(context).size;

    if (playTrailer) {
      return ClipRRect(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
        ),
        child: YoutubePlayer(
          controller: _youtubeController,
          showVideoProgressIndicator: true,
          onEnded: (metaData) {
            setState(() {
              playTrailer = false;
            });
          },
        ),
      );
    }
    return Stack(
      children: [
        Hero(
          tag: widget.movie.title,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: size.height * 0.6,
              minWidth: size.width,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500/${widget.movie.backdropPath}',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
              gradient: LinearGradient(
                begin: FractionalOffset.bottomCenter,
                end: FractionalOffset.topCenter,
                colors: [
                  Colors.black54,
                  Colors.transparent.withOpacity(0.0),
                ],
                stops: [0.1, 1.0],
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 18,
                    left: 18,
                  ),
                  child: Container(
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: SingleChildScrollView(
                                reverse: true,
                                physics: BouncingScrollPhysics(),
                                child: MovieTitleAndReleaseDateWidget(
                                  movieItem: widget.movie,
                                  fontSize: fontSize,
                                ),
                              ),
                            ),
                            FutureBuilder<MovieDetailsModel>(
                                future: movieDetailed,
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return SizedBox(
                                      height: size.width * 0.035 + 4,
                                    );
                                  }
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 4.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          '${snapshot.data.voteCount} reviews',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              .copyWith(
                                                color: Colors.white
                                                    .withOpacity(0.7),
                                                fontSize: size.width * 0.035,
                                              ),
                                        ),
                                        Text(
                                          '${snapshot.data.runtime}min',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              .copyWith(
                                                color: Colors.white
                                                    .withOpacity(0.7),
                                                fontSize: size.width * 0.035,
                                              ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                            Expanded(
                              child: GenreListChipsWidget(
                                movieItem: widget.movie,
                                genresList: widget.genresList,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: FutureBuilder<MovieDetailsModel>(
                            future: movieDetailed,
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return SizedBox(
                                  height: 45,
                                  width: 45,
                                );
                              }
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    _youtubeController =
                                        YoutubePlayerController(
                                      initialVideoId:
                                          snapshot.data.videos.results[0].key,
                                      flags: YoutubePlayerFlags(
                                        autoPlay: true,
                                        mute: false,
                                      ),
                                    );
                                    playTrailer = true;
                                  });
                                },
                                child: Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color(0xFFff7652).withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 7,
                                      ),
                                    ],
                                    color: Color(0xFFff7652),
                                    borderRadius: BorderRadius.circular(
                                      30,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.play_arrow,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
