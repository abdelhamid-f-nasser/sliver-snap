import 'package:flutter/material.dart';

class CollapsedAppBarContent extends StatelessWidget {
  const CollapsedAppBarContent({
    super.key,
    this.title,
    this.leading,
    this.trailing,
  });

  /// The title of the app bar.
  ///
  final Widget? title;

  /// The leading widget of the app bar.
  ///
  /// It is usually a [BackButton] or a [CloseButton].
  final Widget? leading;

  /// The trailing widget of the app bar.
  ///
  ///
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        leading ?? const SizedBox(),
        if (leading != null) const SizedBox(width: 10),
        title ?? const SizedBox(),
        const Spacer(),
        trailing ?? const SizedBox(),
        const SizedBox(width: 10),
      ],
    );
  }
}
