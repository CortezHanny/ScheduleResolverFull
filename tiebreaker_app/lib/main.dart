import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/decision_service.dart';
import 'screens/home_screen.dart';

void main() => runApp(const TieBreakerApp());

class TieBreakerApp extends StatelessWidget {

  const TieBreakerApp ({super.key});

  @override
  Widget build(BuildContext content) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DecisionService()),
      ],

      child: MaterialApp(
        title: 'TieBreaker App',
        theme: ThemeData(colorSchemeSeed: Colors.deepPurple),
        home: ProcessingScreen(),
      ),
    );
  }
}