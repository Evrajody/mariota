import 'package:flutter/material.dart';
import 'package:mariota/screens/mariota_home.dart';

void main(List<String> args) {
  runApp(const MariotaApp());
}

class MariotaApp extends StatelessWidget {
  const MariotaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      home: const MariotaHome(),
    );
  }
}
