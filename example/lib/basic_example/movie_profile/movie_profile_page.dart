import 'package:example/basic_example/models/index.dart';
import 'package:example/basic_example/movie_profile/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sliver_snap/sliver_snap.dart';

class MovieProfilePage extends HookWidget {
  const MovieProfilePage({super.key, required this.movieDetails});

  final MovieDetails movieDetails;
  static const expandedBarHeight = 400.0;

  @override
  Widget build(BuildContext context) {
    final isCollapsedValueNotifier = useState(false);

    return SliverSnap(
      onCollapseStateChanged: (isCollapsed, scrollingOffset, maxExtent) {
        isCollapsedValueNotifier.value = isCollapsed;
      },
      collapsedBackgroundColor: Colors.black,
      expandedBackgroundColor: Colors.transparent,
      backdropWidget: BlurredBackdropImage(movieDetails: movieDetails),
      bottom: const BottomBarWidget(),
      expandedContentHeight: expandedBarHeight,
      expandedContent: ExpandedAppBarContent(
        movieDetails: movieDetails,
      ),
      collapsedContent: CollapsedAppBarContent(
        leading: const BackButton(
          color: Colors.white,
        ),
        title: Text(
          movieDetails.title ?? '',
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: SizedBox(
          height: 40,
          child: Image.network(
            movieDetails.productionCompanies?.first.logoPath ?? '',
            fit: BoxFit.cover,
          ),
        ),
      ),
      body: Material(
        elevation: 7,
        borderRadius: getBorderRadius(isCollapsedValueNotifier),
        child: PageBodyWidget(movieDetails: movieDetails),
      ),
    );
  }

  BorderRadius getBorderRadius(ValueNotifier<bool> isCollapsed) {
    return !isCollapsed.value
        ? const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(
              15,
            ),
          )
        : BorderRadius.zero;
  }
}
