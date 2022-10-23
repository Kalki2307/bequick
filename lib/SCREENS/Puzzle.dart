import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PuzzleScreen extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: 'Be Quick',
      home: First(),
    );
  }
}
