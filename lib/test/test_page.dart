import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
   
  const TestPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Titulo'),
      ),
      body: const Center(
         child: Text('TestPage'),
      ),
    );
  }
}