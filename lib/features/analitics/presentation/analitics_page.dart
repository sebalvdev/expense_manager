import 'package:flutter/material.dart';

class AnaliticsPage extends StatelessWidget {
   
  const AnaliticsPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Titulo'),
      ),
      body: const Center(
         child: Text('AnaliticsPage'),
      ),
    );
  }
}