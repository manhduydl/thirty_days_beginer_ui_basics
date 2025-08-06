import 'package:flutter/material.dart';
import 'package:thirty_days_beginer_ui_basics/list_with_spaced_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        cardTheme: CardThemeData(
          color: Colors.blue.shade50,
        ),
      ),
      home: ListWithSpacedItem(),
    );
  }
}
