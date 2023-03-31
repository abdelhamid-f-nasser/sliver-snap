import 'package:flutter/material.dart';
import 'package:sliver_snap/widgets/index.dart';

class SnappingScrollNotificationHandler {
  final double expandedBarHeight;
  final double collapsedBarHeight;
  final double bottomBarHeight;
  final bool shouldAddHapticFeedback;

  SnappingScrollNotificationHandler({
    required this.expandedBarHeight,
    required this.collapsedBarHeight,
    this.bottomBarHeight = 0.0,
    this.shouldAddHapticFeedback = false,
  })  : assert(
          expandedBarHeight > 0.0,
          'Expanded Bar Height cannot be negative',
        ),
        assert(
          collapsedBarHeight > 0.0,
          'Collapsed bar height cannot have a negative value',
        ),
        assert(
          collapsedBarHeight < expandedBarHeight,
          'Expanded bar height value must have a higher value than the collapsed bar height value',
        );

  factory SnappingScrollNotificationHandler.withHapticFeedback({
    required double expandedBarHeight,
    required double collapsedBarHeight,
    double bottomBarHeight = 0.0,
  }) =>
      SnappingScrollNotificationHandler(
        expandedBarHeight: expandedBarHeight,
        collapsedBarHeight: collapsedBarHeight,
        shouldAddHapticFeedback: true,
        bottomBarHeight: bottomBarHeight,
      );

  /// Scrolling Notification listener
  ///
  /// triggers haptic feedback and snaps the appbar to either collapse or expand
  /// depending on which state is closest to the current scrolling offset
  bool handleScrollNotification({
    required ScrollNotification notification,
    required ScrollController scrollController,
    required ValueNotifier<bool> isCollapsedValueNotifier,
    CollapsingStateCallback? onCollapseStateChanged,
  }) {
    /// The position at which we either collapse or expand
    ///
    /// the threshold which if we exceed then we should expand
    /// otherwise we should collapse the appbar
    final double expandThresholdPosition =
        (expandedBarHeight - collapsedBarHeight) / 1.75;

    /// The current position of the scrolling
    final double currentScrollingPosition = scrollController.offset;

    /// sets the collapsed and expanded views as the user scrolls
    //region Update isCollapsed value as user scrolls
    _updateIsAppBarCollapsed(
      isCollapsed: isCollapsedValueNotifier,
      scrollController: scrollController,
      expandThresholdPosition: expandThresholdPosition,
      onCollapseStateChanged: onCollapseStateChanged,
    );
    //endregion

    //region
    if (notification is ScrollEndNotification) {
      _snapAppBar(
        currentScrollingPosition: currentScrollingPosition,
        expandThresholdPosition: expandThresholdPosition,
        scrollController: scrollController,
      );
    }
    //endregion

    return false;
  }

  /// Snaps the app bar to either fully expanded or fully collapsed position.
  void _snapAppBar({
    required double currentScrollingPosition,
    required double expandThresholdPosition,
    required ScrollController scrollController,
  }) {
    if (_shouldSnapAppBarFullyExpanded(
      currentScrollingPosition,
      expandThresholdPosition,
    )) {
      _scrollToOffset(scrollController: scrollController, scrollToOffset: 0.0);
    } else if (_shouldSnapAppBarFullyCollapsed(
      currentScrollingPosition,
      expandThresholdPosition,
    )) {
      _scrollToOffset(
        scrollController: scrollController,
        scrollToOffset:
            expandedBarHeight - collapsedBarHeight - bottomBarHeight,
      );
    }
  }

  /// Returns `true` if the app bar should snap to fully collapsed position.
  bool _shouldSnapAppBarFullyCollapsed(
    double currentScrollingPosition,
    double expandThresholdPosition,
  ) {
    return currentScrollingPosition > expandThresholdPosition &&
        currentScrollingPosition < expandedBarHeight - collapsedBarHeight;
  }

  /// Returns `true` if the app bar should snap to fully expanded position.
  bool _shouldSnapAppBarFullyExpanded(
    double currentScrollingPosition,
    double expandThresholdPosition,
  ) {
    return currentScrollingPosition < expandThresholdPosition;
  }

  /// Updates the isCollapsed value as the user scrolls up and down
  ///
  /// if the current offset is greater than the expandThresholdPosition
  /// then we set isCollapsed to true
  ///
  void _updateIsAppBarCollapsed({
    required ValueNotifier<bool> isCollapsed,
    required ScrollController scrollController,
    required double expandThresholdPosition,
    CollapsingStateCallback? onCollapseStateChanged,
  }) {
    isCollapsed.value = scrollController.hasClients &&
        scrollController.offset > expandThresholdPosition;
    onCollapseStateChanged?.call(
      isCollapsed.value,
      scrollController.offset,
      scrollController.position.maxScrollExtent,
    );
  }

  /// Scrolls to the calculated [scrollToOffset] from the previous step
  ///
  /// snaps the appbar to either collapse or expand depending on which
  /// state is closest to the current scrolling offset
  void _scrollToOffset({
    required ScrollController scrollController,
    required double scrollToOffset,
  }) {
    Future.microtask(
      () => scrollController.animateTo(
        scrollToOffset,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeIn,
      ),
    );
  }
}
