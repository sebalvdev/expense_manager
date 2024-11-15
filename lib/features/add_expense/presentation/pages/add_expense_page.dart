import 'package:flutter/material.dart';

import '../../../../core/utilities/widegets/widgets.dart';

// ignore: must_be_immutable
class AddExpensePage extends StatelessWidget {
  TextEditingController moneyController = TextEditingController();
   
  AddExpensePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Titulo'),
      ),
      body: Column(
        children: [
          const Text('Agrega un monto'),
          CustomeInput(controller: moneyController, hintText: 'hintText', numeric: true,),
          const TextField()
        ],
      ),
    );
  }
}