import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sliver_snap/widgets/index.dart';

typedef CollapsingStateCallback = void Function(
  bool isCollapsed,
  double scrollingOffset,
  double maxExtent,
);

class SnappingCollapsingAppBar extends HookWidget {
  final ScrollController? scrollController;

  /// The content that is shown when the appBar is expanded
  ///
  /// (e.g. a movie poster and it's ratings)
  final Widget expandedContent;

  /// The collapsed appbar or content that is shown when state is collapsed
  ///
  /// (e.g. the title of the movie)
  final Widget collapsedContent;

  /// The content that is shown below the appbar
  final Widget body;

  /// The height of the [ExpandedContent]
  final double? expandedContentHeight;

  /// The height of the [collapsedContent]
  final double collapsedBarHeight;
  final bool floating;
  final bool pinned;
  final bool snap;
  final bool stretch;
  final List<Widget>? actions;
  final Widget? leading;
  final PreferredSizeWidget? bottom;

  /// The widget that is shown behind the [ExpandedContent]
  ///
  /// (e.g. a blurred image of the movie poster)
  final Widget? backdropWidget;

  /// The background color of the expanded appbar.
  final Color? expandedBackgroundColor;

  ///  The background color of the collapsed appbar.
  final Color? collapsedBackgroundColor;

  final ScrollBehavior? scrollBehavior;

  /// Callback that is called when the [ExpandedContent] is collapsed or expanded
  ///
  final CollapsingStateCallback? onCollapseStateChanged;

  /// The duration of the animation when the [ExpandedContent] is collapsing or expanding
  ///
  /// Defaults to [Duration(milliseconds: 300)]
  final Duration? animationDuration;

  /// The curve of the animation as the [ExpandedContent] is collapsing or expanding
  ///
  /// Defaults to [Curves.easeInOut]
  final Curve? animationCurve;

  const SnappingCollapsingAppBar({
    super.key,
    required this.expandedContent,
    required this.collapsedContent,
    required this.body,
    this.onCollapseStateChanged,
    this.expandedContentHeight,
    this.scrollController,
    this.scrollBehavior,
    this.floating = false,
    this.pinned = true,
    this.snap = false,
    this.stretch = false,
    this.bottom,
    this.leading,
    this.actions,
    this.collapsedBarHeight = 60.0,
    this.backdropWidget,
    this.expandedBackgroundColor,
    this.collapsedBackgroundColor,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeInOut,
  });

  @override
  Widget build(BuildContext context) {
    final isCollapsedValueNotifier = useState(false);
    final defaultExpandedContentHeight =
        expandedContentHeight ?? MediaQuery.of(context).size.height / 2;

    final controller = scrollController ?? useScrollController();
    final snappingScrollNotificationHandler =
        SnappingScrollNotificationHandler.withHapticFeedback(
      expandedBarHeight: defaultExpandedContentHeight,
      collapsedBarHeight: collapsedBarHeight,
      bottomBarHeight: bottom?.preferredSize.height ?? 0.0,
    );
    final scrollPercentValueNotifier = useState(0.0);
    final animatedOpacity = useState(1.0);

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) =>
          snappingScrollNotificationHandler.handleScrollNotification(
        notification: notification,
        isCollapsedValueNotifier: isCollapsedValueNotifier,
        onCollapseStateChanged: (isCollapsed, scrollingOffset, maxExtent) {
          onCollapseStateChanged?.call(
            isCollapsedValueNotifier.value,
            controller.offset,
            controller.position.maxScrollExtent,
          );

          scrollPercentValueNotifier.value = 1 - scrollingOffset / maxExtent;
          animatedOpacity.value =
              _calculateOpacity(scrollPercentValueNotifier.value);
        },
        scrollController: controller,
      ),
      child: SnappingAppBarBody(
        scrollController: controller,
        backdropWidget: backdropWidget,
        collapsedBar: collapsedContent,
        bottom: bottom,
        expandedContent: AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: animatedOpacity.value,
          child: expandedContent,
        ),
        leading: leading,
        actions: actions,
        pinned: pinned,
        floating: floating,
        snap: snap,
        stretch: stretch,
        body: body,
        scrollBehavior: scrollBehavior,
        collapsedBarHeight: collapsedBarHeight,
        expandedContentHeight: defaultExpandedContentHeight,
        collapsedBackgroundColor: collapsedBackgroundColor,
        expandedBackgroundColor: expandedBackgroundColor,
        isCollapsed: isCollapsedValueNotifier.value,
      ),
    );
  }

  /// Calculates the opacity based on the scroll percentage.
  ///
  /// The opacity is calculated as follows:
  /// - If the scroll percentage is less than [opacityThreshold],
  /// the opacity is 0.0.
  ///
  /// - If the scroll percentage is less than [maxScrollPercentage],
  /// the opacity is
  /// [scrollPercentage] minus [opacityAdjustment].
  ///
  /// - Otherwise, the opacity is [scrollPercentage].
  ///
  /// Returns 1.0 if the [scrollPercentage] is not between 0.0 and 1.0.
  ///
  /// Params:
  /// - [scrollPercentage] : the percentage of the scroll position, a double value
  /// Returns:
  /// - The calculated opacity, a double value
  double _calculateOpacity(double scrollPercentage) {
    const double opacityThreshold = 0.5;
    const double opacityAdjustment = 0.5;
    const double maxScrollPercentage = 1.0;

    if (scrollPercentage < 0 || scrollPercentage > maxScrollPercentage) {
      return 1.0;
    }

    if (scrollPercentage < opacityThreshold) {
      return 0.0;
    } else if (scrollPercentage < maxScrollPercentage) {
      return scrollPercentage - opacityAdjustment;
    } else {
      return scrollPercentage;
    }
  }
}
