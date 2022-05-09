// this screen is used to show the results 

import 'package:flutter/material.dart';

class ResultsSCreen extends StatelessWidget {
  ResultsSCreen({required this.total, required this.yourguess});
  final int total;
  final int yourguess;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(100),
        decoration: BoxDecoration(color: Colors.black),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('images/meme.png'),
            Center(
              child: Text(
                ('$yourguess/$total'),
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 30.0,
                  //fontFamily: 'ConcertOne',
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
