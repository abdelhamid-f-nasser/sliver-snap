import 'dart:developer';

import 'package:flutter/material.dart';

class BottomBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const BottomBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: const Icon(
            Icons.home,
            color: Colors.white,
          ),
          onPressed: () => log('Home pressed'),
        ),
        IconButton(
          icon: const Icon(
            Icons.favorite,
            color: Colors.white,
          ),
          onPressed: () => log('Favorite pressed'),
        ),
        IconButton(
          icon: const Icon(
            Icons.person,
            color: Colors.white,
          ),
          onPressed: () => log('Person pressed'),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
