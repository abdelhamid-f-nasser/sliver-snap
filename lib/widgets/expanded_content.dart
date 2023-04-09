import 'package:flutter/material.dart';
import 'package:sliver_snap/sliver_snap.dart';

/// Widget which is shown when the [SliverSnap] is expanded.
///
/// Helps in adding a leading widget only in the expanded state.
class ExpandedContent extends StatelessWidget {
  /// The child widget of the [ExpandedContent].
  ///
  final Widget? child;

  /// The leading widget of the [ExpandedContent].
  ///
  /// It is usually a [BackButton] or a [CloseButton].
  ///
  /// Use this only when you need a leading widget only in the expanded state.
  ///
  /// Take care when adding the [leading] widget both here and
  /// in the [SliverSnap] widget, as they might overlap.
  final Widget? leading;

  const ExpandedContent({
    super.key,
    this.child,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (child != null) child!,
        if (leading != null)
          SafeArea(
            child: leading!,
          ),
      ],
    );
  }
}
