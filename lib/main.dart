import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'config/themes/custome_theme.dart';
import 'features/welcome/presentation/pages/welcome_page.dart';

// import 'features/home/presentation/home_page.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // debugShowCheckedModeBanner: false,
      // ! estas tres configuraciones aplican el cambio de tema segun el tema del dispositivo
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      // home: const HomePage(),
      home: const WelcomePage(),
    );
  }
}