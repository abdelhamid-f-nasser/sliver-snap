import 'package:flutter/material.dart';

class FavoriteButtonWidget extends StatelessWidget {
  const FavoriteButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.0,
      child: OutlinedButton(
        child: const Icon(
          Icons.favorite_outline,
          color: Colors.black,
        ),
        onPressed: () {},
      ),
    );
  }
}
