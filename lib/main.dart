import 'package:barter/ui/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// We create a "provider", which will store a value (here "Hello world").
// By using a provider, this allows us to mock/override the value exposed.
final helloWorldProvider = Provider((_) => 'Hello world');

void main() {
  runApp(
    // For widgets to be able to read providers, we need to wrap the entire
    // application in a "ProviderScope" widget.
    // This is where the state of our providers will be stored.
    ProviderScope(
      child: MyApp(),
    ),
  );
}

// Extend ConsumerWidget instead of StatelessWidget, which is exposed by Riverpod
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.orange,
        primarySwatch: Colors.orange,
        accentColor: Colors.orangeAccent,
        scaffoldBackgroundColor: Colors.white,
        buttonTheme: ButtonThemeData(
          height: 48,
          colorScheme: ColorScheme.fromSwatch(
            primaryColorDark: Colors.deepOrange,
            primarySwatch: Colors.orange,
            accentColor: Colors.orangeAccent,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.white,
          centerTitle: true,
          brightness: Brightness.light,
        ),
        inputDecorationTheme: InputDecorationTheme(
          isCollapsed: true,
          isDense: true,
          border: UnderlineInputBorder(),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        ),
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          margin: EdgeInsets.zero,
        ),
      ),
      home: MainDashboardView(),
    );
  }
}
