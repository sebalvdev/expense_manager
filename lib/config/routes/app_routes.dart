import 'package:flutter/material.dart';

import '../../features/add_expense/presentation/pages/add_expense_page.dart';
import '../../features/analitics/presentation/analitics_page.dart';
import '../../features/home/presentation/pages/home_page.dart';


class AppRoutes {
  static const String home = '/';
  static const String expenses = '/expenses';
  static const String analitics = '/analitics';

  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case expenses:
        return _materialRoute(AddExpensePage());
      case analitics:
        return _materialRoute(const AnaliticsPage());
      // case namePlayers:
        // final int numberPlayers = int.parse(settings.arguments as String);
        // return _materialRoute(NamePlayersPage(numberPlayers: numberPlayers,));
      // case eventHome:
      //   if (settings.arguments is Map<String, dynamic>) {
      //     final args = settings.arguments as Map<String, dynamic>;
      //     return _materialRoute(EventHomePage(eventInfo: args));
      //   }
      //   return _materialRoute(
      //       const EventHomePage(eventInfo: <String, dynamic>{}));
      // case qrScanner:
      // return _materialRoute(const QRScannerPage());
      default:
        return _materialRoute(const HomePage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
