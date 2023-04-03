import 'package:flutter/material.dart';

/// Widget which is shown when the [SliverSnap] is expanded.
///
/// Helps in adding a leading widget only in the expanded state.
class ExpandedContent extends StatelessWidget {
  final Widget? child;
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
