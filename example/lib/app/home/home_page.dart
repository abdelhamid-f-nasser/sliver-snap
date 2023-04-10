import 'package:example/basic_example/models/index.dart';
import 'package:example/basic_example/movie_profile/index.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SliverSnap Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MovieProfilePage(
                      movieDetails: FakeData.theBatmanMovie,
                    ),
                  ),
                );
              },
              child: const Text(
                'Example 1',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
