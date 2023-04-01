import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sliver_snap/widgets/index.dart';

typedef CollapsingStateCallback = void Function(
  bool isCollapsed,
  double scrollingOffset,
  double maxExtent,
);

class SliverSnap extends HookWidget {
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

  /// Whether the app bar should become visible as soon as the user scrolls
  /// towards the app bar.
  ///
  /// Otherwise, the user will need to scroll near the top of the scroll view to
  /// reveal the app bar.
  ///
  /// If [snap] is true then a scroll that exposes the app bar will trigger an
  /// animation that slides the entire app bar into view. Similarly if a scroll
  /// dismisses the app bar, the animation will slide it completely out of view.
  ///
  /// ## Animated Examples
  ///
  /// The following animations show how the app bar changes its scrolling
  /// behavior based on the value of this property.
  ///
  /// * App bar with [floating] set to false:
  ///   {@animation 476 400 https://flutter.github.io/assets-for-api-docs/assets/material/app_bar.mp4}
  /// * App bar with [floating] set to true:
  ///   {@animation 476 400 https://flutter.github.io/assets-for-api-docs/assets/material/app_bar_floating.mp4}
  ///
  /// See also:
  ///
  ///  * [SliverAppBar] for more animated examples of how this property changes the
  ///    behavior of the app bar in combination with [pinned] and [snap].
  final bool floating;

  /// Whether the appbar will be fixed at the top of the scroll view
  ///
  /// meaning it will always be visible to the user
  /// as they scroll through the content.
  ///
  /// Although the appbar can still change in size as the user scrolls,
  /// it will not be scrolled out of view like other elements in the scroll view.
  ///
  /// ## Animated Examples
  ///
  /// The following animations show how the app bar changes its scrolling
  /// behavior based on the value of this property.
  ///
  /// * App bar with [floating] set to false:
  ///   {@animation 476 400 https://flutter.github.io/assets-for-api-docs/assets/material/app_bar.mp4}
  /// * App bar with [floating] set to true:
  ///   {@animation 476 400 https://flutter.github.io/assets-for-api-docs/assets/material/app_bar_floating.mp4}
  ///
  /// See also:
  ///
  ///  * [SliverAppBar] for more animated examples of how this property changes the
  final bool pinned;

  /// Controls the behavior of a floating app bar when the user scrolls.
  ///
  /// When [snap] is false, the app bar will move smoothly with the content as the
  /// user scrolls, and will be dismissed smoothly when the user scrolls down.
  ///
  /// When [snap] is true, the app bar will have a more rigid behavior. It will
  /// snap into view when the user scrolls up and snap out of view when the user
  /// scrolls down. Additionally, when the user interacts with any part of the
  /// floating app bar, such as clicking on a [TextField], the app bar will snap
  /// fully into view so that the user can see and interact with all of its
  /// contents.
  ///
  /// ## Animated Examples
  ///
  /// The following animations show how the app bar changes its scrolling
  /// behavior based on the value of this property.
  ///
  /// * App bar with [snap] set to false:
  ///   {@animation 476 400 https://flutter.github.io/assets-for-api-docs/assets/material/app_bar_floating.mp4}
  /// * App bar with [snap] set to true:
  ///   {@animation 476 400 https://flutter.github.io/assets-for-api-docs/assets/material/app_bar_floating_snap.mp4}
  ///
  /// This property only applies to floating app bars.
  ///
  /// See also:
  ///
  ///  * [SliverAppBar], for more examples of how this property affects app bar
  ///    behavior in combination with [SliverAppBar.snap] and [SliverAppBar.floating].
  final bool snap;

  ///  Whether the app bar should stretch to fill the over-scroll area.
  ///
  ///  The appbar can still expand and contract as the user scrolls,
  ///  but it  will also stretch when the user over-scrolls.
  ///
  final bool stretch;

  /// A list of action widgets to display in a row,
  /// after the [collapsedContent] widget.
  ///
  final List<Widget>? actions;

  /// The leading widget at the start of the appbar,
  /// typically an [Icon] or an [IconButton].
  ///
  /// It can also be a [BackButton].
  ///
  final Widget? leading;

  ///The content that is shown below the appbar.
  ///In most cases it's just the page content.
  ///
  final PreferredSizeWidget? bottom;

  /// The widget that is shown behind the [ExpandedContent]
  ///
  /// (e.g. a blurred image of the movie poster)
  final Widget? backdropWidget;

  /// The background color of the expanded appbar.
  final Color? expandedBackgroundColor;

  ///  The background color of the collapsed appbar.
  final Color? collapsedBackgroundColor;

  /// How the scrolling behaves, either Material or Cupertino.
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

  const SliverSnap({
    super.key,
    required this.expandedContent,
    required this.collapsedContent,
    required this.body,
    this.pinned = true,
    this.collapsedBarHeight = 60.0,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeInOut,
    this.snap = false,
    this.floating = false,
    this.stretch = false,
    this.expandedContentHeight,
    this.bottom,
    this.leading,
    this.actions,
    this.backdropWidget,
    this.expandedBackgroundColor,
    this.collapsedBackgroundColor,
    this.scrollController,
    this.scrollBehavior,
    this.onCollapseStateChanged,
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
