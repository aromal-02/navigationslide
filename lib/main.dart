
import 'package:flutter/material.dart';
import 'package:navigation/drag_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 5, 1, 23),
        body: Center(
          child: HoverScaleIcon(),
        ),
      ),
    );
  }
}
