import 'package:flutter/material.dart';

class Utilities {
  Future<void> prechargeImage(BuildContext context, String image) async {
    await precacheImage(AssetImage(image), context);
    // Puedes cargar otros recursos aquí si es necesario
  }
}
