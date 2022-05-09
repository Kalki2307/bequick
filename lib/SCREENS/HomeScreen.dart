// this screen represent the home screen which has categories of level

import 'package:flutter/material.dart';
import '../Transation_1.0.dart';
import 'QuizScreen.dart';

class First extends StatefulWidget {
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    final double kScreenWidth = MediaQuery.of(context).size.width;
    final double kScreenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(15),
        height: kScreenHeight,
        width: kScreenWidth,
        decoration: BoxDecoration(
          color: Color(0xFFffffff),
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 0,
              right: 0,
              height: 100,
              child: Upper(),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              top: 100,
              child: Down(),
            ),
          ],
        ),
      ),
    );
  }
}

class LevelDeDoDarling extends StatelessWidget {
  LevelDeDoDarling({
    required this.imagebhido,
    required this.level,
    required this.text,
  });
  String imagebhido;
  String text;
  String level;
  Color level1 = Color(0xFFee2a7b);
  Color level2 = Color(0xFF);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: 190,
        //margin: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          //color: Colors.amber,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 50,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      //Todo
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 15,
                      spreadRadius: 5,
                    ),
                  ],
                  gradient: LinearGradient(colors: [
                    level1,
                    level2,
                  ]),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Leveldedo(level: level, text: text),
              ),
            ),
            Positioned(
              right: 10,
              top: 0,
              bottom: 50,
              child: Image.asset(imagebhido),
            ),
          ],
        ),
      ),
    );
  }
}

class Down extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  DoTransition(
                    QuizScreen(
                      level: 1,
                    ),
                  ),
                );
              },
              child: LevelDeDoDarling(
                imagebhido: 'images/begnier.png',
                level: 'Level 1',
                text: 'Travel newbie',
              ),
            ),
            SizedBox(
              height: 15,
              width: 5,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  DoTransition(
                    QuizScreen(
                      level: 2,
                    ),
                  ),
                );
              },
              child: LevelDeDoDarling(
                imagebhido: 'images/inter2.png',
                level: 'Level 2',
                text: 'Continuing',
              ),
            ),
            SizedBox(
              height: 15,
              width: 5,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  DoTransition(
                    QuizScreen(
                      level: 3,
                    ),
                  ),
                );
              },
              child: LevelDeDoDarling(
                imagebhido: 'images/experience.png',
                level: 'Level 3',
                text: 'Experienced',
              ),
            ),
          ]),
    );
  }
}

class Leveldedo extends StatelessWidget {
  Leveldedo({required this.level, required this.text});
  String level;
  String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            level,
            style: TextStyle(
              color: Color(0xFFffffff).withOpacity(0.9),
              decoration: TextDecoration.none,
              fontWeight: FontWeight.bold,
              fontSize: 17.0,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              color: Color(0xFFffffff),
              decoration: TextDecoration.none,
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
          ),
        ],
      ),
    );
  }
}

class Upper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          //crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // TODO: find the heart icon
            // Icon(
            //   Icons.plu,
            //   color: Colors.blue,
            //   ),
            Icon(
              Icons.person_outline_rounded,
              color: Colors.pink,
            )
          ],
        ),
        Text(
          "Let's Play",
          style: TextStyle(
            color: Color(0xFFFF0A8D),
            decoration: TextDecoration.none,
            fontWeight: FontWeight.w900,
            fontSize: 25.0,
          ),
        ),
        Text(
          "Be the first !!",
          style: TextStyle(
            color: Colors.black54,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
          ),
        ),
      ],
    );
  }
}
