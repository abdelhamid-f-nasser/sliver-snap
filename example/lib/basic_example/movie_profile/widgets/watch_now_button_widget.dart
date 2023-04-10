import 'package:flutter/material.dart';

class WatchNowButtonWidget extends StatelessWidget {
  const WatchNowButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          EdgeInsets.zero,
        ),
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
      child: Ink(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0DC0F7),
              Color(0xFF3087DC),
            ],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        child: Container(
          constraints: const BoxConstraints(
            minWidth: 88.0,
            minHeight: 45.0,
          ),
          alignment: Alignment.center,
          child: const Text(
            'Watch now',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
