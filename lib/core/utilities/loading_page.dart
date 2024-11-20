import 'package:flutter/material.dart';

import '../constants/constants.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network('https://placehold.co/250/png'),
            const SizedBox(height: 50),
            const CircularProgressIndicator(
              color: primary,
            )
            // const SizedBox(
            //   width: 250,
            //   child: LinearProgressIndicator(
            //     color: primary,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
