import 'package:flutter/material.dart';
import 'package:test_app/screens/Detail/detail_screen.dart';
import 'package:test_app/screens/Main/main_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigator 2.0 Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (screens) {
        switch (screens.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => const MainScreen());
          case '/detail':
            return MaterialPageRoute(builder: (_) => const DetailScreen());
          default:
            return null;
        }
      },
    );
  }
}
