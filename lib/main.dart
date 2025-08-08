import 'package:flutter/material.dart';
import 'package:thirty_days_beginer_ui_basics/widget_state.dart';

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
          useMaterial3: true,
          splashColor: Colors.blue.shade100,
          hoverColor: Colors.deepPurple.shade50,
          highlightColor: Colors.redAccent.withValues(alpha: 0.1),
          checkboxTheme: CheckboxThemeData(
              checkColor: WidgetStateColor.fromMap({
                WidgetState.hovered: Colors.red,
                WidgetState.disabled: Colors.grey,
                WidgetState.any: Colors.white,
              }),
              fillColor: WidgetStateColor.fromMap({
                WidgetState.selected: Colors.blue,
                WidgetState.any: Colors.white,
              }),
              overlayColor: WidgetStateProperty.fromMap({
                WidgetState.selected: Colors.red,
                WidgetState.any: Colors.grey.withValues(alpha: 0.1),
              })),
          listTileTheme: ListTileThemeData(
              textColor: WidgetStateColor.fromMap({
                WidgetState.disabled: Colors.pinkAccent,
                WidgetState.any: Colors.blue
              }),
              iconColor: WidgetStateColor.fromMap({
                WidgetState.disabled: Colors.pinkAccent,
                WidgetState.any: Colors.blue,
              }))),
      home: DemoWidgetState(),
    );
  }
}
