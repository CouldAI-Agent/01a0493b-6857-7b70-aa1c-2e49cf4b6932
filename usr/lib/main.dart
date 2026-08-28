import 'package:flutter/material.dart';

void main() {
  runApp(const EmptyApp());
}

class EmptyApp extends StatelessWidget {
  const EmptyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blank App',
      initialRoute: '/',
      routes: {
        '/': (context) => const Scaffold(
              body: Center(
                child: Text('Blank App'),
              ),
            ),
      },
    );
  }
}
