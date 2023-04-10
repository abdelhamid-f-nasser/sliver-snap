
import 'package:example/basic_example/models/index.dart';
import 'package:example/basic_example/movie_profile/index.dart';
import 'package:flutter/material.dart';
import 'package:sliver_snap/sliver_snap.dart';

class ExpandedAppBarContent extends StatelessWidget {
  const ExpandedAppBarContent({
    super.key,
    required this.movieDetails,
  });

  final MovieDetails movieDetails;

  @override
  Widget build(BuildContext context) {
    return ExpandedContent(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 140,
              height: 200,
              child: Material(
                borderRadius: BorderRadius.circular(
                  15,
                ),
                elevation: 7,
                clipBehavior: Clip.antiAlias,
                child: Image.network(
                  movieDetails.posterPath ?? '',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              movieDetails.title ?? '',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              movieDetails.tagline ?? '',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedChip(
                  label: (movieDetails.voteAverage ?? 0.0).toStringAsFixed(1),
                  icon: const Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                OutlinedChip(
                  label: movieDetails.productionCountries?.first.iso31661 ?? '',
                  icon: const Icon(
                    Icons.flag,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                OutlinedChip(
                  label: movieDetails.spokenLanguages?.first.iso6391
                      ?.toUpperCase() ??
                      '',
                  icon: const Icon(
                    Icons.language,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ],
          ),
        ],
      ),
      leading: const BackButton(
        color: Colors.white,
      ),
    );
  }
}
