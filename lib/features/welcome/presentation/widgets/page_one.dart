import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content(context),
    );
  }

  Widget content(BuildContext context) {
    double mediaHeight = MediaQuery.of(context).size.height / 3;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network('https://placehold.co/250x50/png'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Image.network('https://placehold.co/${mediaHeight.toInt()}/png'),
          ),
          // const Text(
          //   'Welcome to Page One!',
          //   style: TextStyle(color: Colors.white, fontSize: 24),
          // ),
          ListTile(
            title: Text('Welcome to Page One', textAlign: TextAlign.center, style: TextStyle(fontSize: h2),),
            subtitle: Text('data', textAlign: TextAlign.center, style: TextStyle(fontSize: h3),),
          )
        ],
      ),
    );
  }
}
