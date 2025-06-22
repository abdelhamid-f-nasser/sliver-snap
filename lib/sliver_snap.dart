/// This library provides a widget that allows you to create a custom sliver app bar with snapping and scrolling effects and animations.
///
/// 1. To use this library, import `package:sliver_snap/sliver_snap.dart`.
///
/// 1. Then use the [SliverSnap] widget as the body of your [Scaffold] and provide the
/// [expandedContent], [collapsedContent] and the [body] widgets as arguments.
///
/// - The [expandedContent] is the widget that will be shown when the sliver app
/// bar is fully expanded.
/// - The [collapsedContent] is the widget that will be shown when the sliver app
/// bar is fully collapsed.
/// - The [body] is the widget that will be scrolled below the sliver app bar.
///
/// > See the example directory for a complete sample app that demonstrates how
/// to use the [SliverSnap] widget.
library;

export 'sliver_snap.dart';
export 'widgets/index.dart';
