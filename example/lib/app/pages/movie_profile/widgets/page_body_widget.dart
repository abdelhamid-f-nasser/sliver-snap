
import 'package:example/app/models/movie_details.dart';
import 'package:example/app/pages/movie_profile/widgets/favorite_button_widget.dart';
import 'package:example/app/pages/movie_profile/widgets/watch_now_button_widget.dart';
import 'package:flutter/material.dart';

/// Shows the body of the movie details
///includes the watch now, favorite buttons and the movie introduction
class PageBodyWidget extends StatelessWidget {
  const PageBodyWidget({
    super.key,
    required this.movieDetails,
  });

  final MovieDetails movieDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Expanded(
                child: WatchNowButtonWidget(),
              ),
              SizedBox(
                width: 10,
              ),
              FavoriteButtonWidget(),
            ],
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          // Introduction title
          const Text(
            'Introduction',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            movieDetails.overview ?? '',
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
