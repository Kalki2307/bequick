import 'package:flutter/material.dart';
Gradient whitee = LinearGradient(
    colors: [Colors.white, Colors.white],
  );
  // this will give the default color to the option
  Gradient kOptionA = whitee;
  Gradient kOptionB = whitee;
  Gradient kOptionC = whitee;
  Gradient kOptionD = whitee;

  // this gives a green color to mark the right answer when choosen
  Gradient kCallMeGreens = LinearGradient(
    colors: [Colors.greenAccent, Color(0xFF00ff00)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  // this gives a red color to mark the wrong answer when choosen
  Gradient kCallMeReds = LinearGradient(
    colors: [Colors.redAccent, Color(0xFFff0066)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  Gradient resultscreengradient = LinearGradient(
    colors: [Color(0xFF00a1ff), Color(0xFF00ff8f)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );