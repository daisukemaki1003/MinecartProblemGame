import 'package:flutter/material.dart';

import 'screen/game_main.dart';
import 'widget_test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: const Text(
            "Start",
            style: TextStyle(color: Colors.red),
          ),
          onPressed: () async {
            await Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) {
              if (true) {
                return GameMainScreen();
              } else {
                return TestScreen();
              }
            }));
          },
        ),
      ),
    );
  }
}
