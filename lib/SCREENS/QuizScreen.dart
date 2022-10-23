// this screen gives you the quiz to play


import 'dart:math';
import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../Transation_1.0.dart';
import '../constants.dart';
import 'ResultScreen.dart';

class QuizScreen extends StatefulWidget {
  final int level;
  QuizScreen({required this.level});
  @override
  _QuizScreenState createState() => _QuizScreenState(level: level);
}

class _QuizScreenState extends State<QuizScreen> {
  int firstNumber = Random().nextInt(50);
  int secondNumber = Random().nextInt(20);
  int whatToDo = Random().nextInt(3);
  int level;
  int dontTouchTwoTimes = 0;
  int answerA = 0;
  int answerB = 0;
  int answerC = 0;
  int answerD = 0;
  int aNewNumberForSecondCounter = 2;
  String showSign = '';
  int luckyNumber = 0; // for random position of your answer
  int waiter = 0;
  int score = 0;
  int totalQuestion = 0;
  int ksetTimer = 5;
  @override
  _QuizScreenState({required this.level}) {
    luckyNumber = Random().nextInt(4);
    if (level == 1) {
      ksetTimer = 10;
    } else if (level == 2) {
      ksetTimer = 5;
    } else {
      ksetTimer = 3;
    }
    generateMeNextNumber();
  }
   
  generateMeNextNumber() {
    // this method gives you the option box its value
    totalQuestion++;
    luckyNumber = Random().nextInt(4);

    if (whatToDo == 0) {
      showSign = '+';
      answerA = (luckyNumber == 0)
          ? firstNumber + secondNumber
          : firstNumber + secondNumber + 2;
      answerB = (luckyNumber == 1)
          ? firstNumber + secondNumber
          : firstNumber + secondNumber + 5;
      answerC = (luckyNumber == 2)
          ? firstNumber + secondNumber
          : firstNumber + secondNumber + 1;
      answerD = (luckyNumber == 3)
          ? firstNumber + secondNumber
          : firstNumber + secondNumber + 3;
    } else if (whatToDo == 1) {
      while (firstNumber < secondNumber) {
        firstNumber = Random().nextInt(25);
        secondNumber = Random().nextInt(10);
      }
      showSign = '-';
      answerA = (luckyNumber == 0)
          ? firstNumber - secondNumber
          : firstNumber - secondNumber - 2;
      answerB = (luckyNumber == 1)
          ? firstNumber - secondNumber
          : firstNumber - secondNumber - 3;
      answerC = (luckyNumber == 2)
          ? firstNumber - secondNumber
          : firstNumber - secondNumber - 1;
      answerD = (luckyNumber == 3)
          ? firstNumber - secondNumber
          : firstNumber - secondNumber - 4;
    } else if (whatToDo == 2) {
      showSign = '*';
      answerA = (luckyNumber == 0)
          ? firstNumber * secondNumber
          : firstNumber * secondNumber - 2;
      answerB = (luckyNumber == 1)
          ? firstNumber * secondNumber
          : firstNumber * secondNumber + 2;
      answerC = (luckyNumber == 2)
          ? firstNumber * secondNumber
          : firstNumber * secondNumber - 1;
      answerD = (luckyNumber == 3)
          ? firstNumber * secondNumber
          : firstNumber * secondNumber + 3;
    }
  }

  int timer = 10;
  int toTheNextQuestion = 1;

  pushMe() {
    // push to the results screen
    Navigator.pushReplacement(
      context,
      DoTransition(
        ResultsSCreen(
          total: totalQuestion,
          yourguess: score,
        ),
      ),
    );
  }

  Gradient kOptionA = LinearGradient(
    colors: [Colors.white, Colors.white],
  );
  Gradient kOptionB = LinearGradient(
    colors: [Colors.white, Colors.white],
  );
  Gradient kOptionC = LinearGradient(
    colors: [Colors.white, Colors.white],
  );
  Gradient kOptionD = LinearGradient(
    colors: [Colors.white, Colors.white],
  );
  static const Gradient kCallMeGreens = LinearGradient(
    colors: [Colors.greenAccent, Color(0xFF00ff00)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const Gradient kCallMeReds = LinearGradient(
    colors: [Colors.redAccent, Color(0xFFff0066)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  final CountdownController _controller =
      new CountdownController(autoStart: true);

  final CountdownController _controller_tixer =
      new CountdownController(autoStart: false);

 

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
          gradient:
              LinearGradient(colors: [Color(0xFF2193b0), Color(0xFF6dd5ed)]),
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        child: Stack(children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            height: 50,
            child: Center(
              child: Container(
                height: 50,
                width: 70,
                decoration: BoxDecoration(
                  //shape: BoxShape.circle,
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.transparent,
                  // borderRadius: BorderRadius.circular(80)
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        //shape: BoxShape.circle,
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.transparent,
                        // borderRadius: BorderRadius.circular(80)
                      ),
                    ),
                    Center(
                      child: Countdown(
                        controller: _controller,
                        seconds: ksetTimer,
                        build: (_, double time) => Text(
                          time.toInt() == 10
                              ? time.toInt().toString()
                              : '0' + time.toInt().toString(),
                          style: TextStyle(
                            color: Color(0xFFffffff),
                            fontSize: 25.0,
                            fontFamily: 'ConcertOne',
                            decoration: TextDecoration.none,
                          ),
                        ),
                        interval: Duration(seconds: 1),
                        onFinished: () {
                          if (totalQuestion == 10) {
                            pushMe();
                          }
                          setState(() {
                            luckyNumber = Random().nextInt(4);
                            firstNumber = Random().nextInt(25);
                            secondNumber = Random().nextInt(10);
                            whatToDo = Random().nextInt(3);
                            generateMeNextNumber();
                            kOptionA = whitee;
                            kOptionB = whitee;
                            kOptionC = whitee;
                            kOptionD = whitee;
                            _controller.restart();
                            _controller_tixer.restart();
                            _controller_tixer.pause();
                            dontTouchTwoTimes = 0;
                          });
                        },
                      ),
                    ),
                    Center(
                      child: Countdown(
                        controller: _controller_tixer,
                        seconds: toTheNextQuestion,
                        build: (_, double time) => Text(
                          time.toInt() == 10
                              ? time.toInt().toString()
                              : '0' + time.toInt().toString(),
                          style: TextStyle(
                            color: Colors.transparent,
                            fontSize: 25.0,
                            fontFamily: 'ConcertOne',
                            decoration: TextDecoration.none,
                          ),
                        ),
                        interval: Duration(seconds: 1),
                        onFinished: () {
                          setState(() {
                            luckyNumber = Random().nextInt(4);
                            firstNumber = Random().nextInt(25);
                            secondNumber = Random().nextInt(10);
                            whatToDo = Random().nextInt(3);
                            generateMeNextNumber();
                            kOptionA = whitee;
                            kOptionB = whitee;
                            kOptionC = whitee;
                            kOptionD = whitee;
                            _controller.restart();
                            _controller_tixer.restart();
                            _controller_tixer.pause();
                            dontTouchTwoTimes = 0;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // Container(
              //   height: 40,
              //   width: 60,
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(15),
              //   ),
              //   child: Center(
              //     child: Text(
              //       '$score',
              //       style: TextStyle(
              //         color: Color(0xFF000000),
              //         fontSize: 25.0,
              //         fontFamily: 'ConcertOne',
              //         decoration: TextDecoration.none,
              //       ),
              //     ),
              //   ),
              // ),
            ),
          ),
          Positioned(
            top: 60,
            right: 0,
            left: 0,
            height: 200,
            child: Center(
              //color: Colors.pink,
              child: Image.asset("images/intermediate.png"),
            ),
          ),
          Positioned(
            top: 280,
            right: 0,
            left: 0,
            height: 80,
            child: Container(
              //color: Colors.purple,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "question $totalQuestion of 10",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w900,
                      fontSize: 15.0,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Center(
                    child: Text(
                      ' $firstNumber $showSign $secondNumber = ?  : ',
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: 370,
              right: 0,
              left: 0,
              bottom: 0,
              child: Container(
                //color: Colors.pink,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (dontTouchTwoTimes == 0) {
                          dontTouchTwoTimes = 1;
                          setState(
                            () {
                              // this conditon is given soo that after the desired
                              // amount of question is done it will move on to the
                              // next page
                              _controller.pause();
                              _controller_tixer.start();
                              if (luckyNumber == 0) {
                                kOptionA = kCallMeGreens;
                                score++;
                              } else {
                                kOptionA = kCallMeReds;

                                if (luckyNumber == 1) {
                                  kOptionB = kCallMeGreens;
                                } else if (luckyNumber == 2) {
                                  kOptionC = kCallMeGreens;
                                } else {
                                  kOptionD = kCallMeGreens;
                                }
                              }
                              if (totalQuestion == 10) {
                                Future.delayed(Duration(seconds: 1));
                                pushMe();
                              }
                            },
                          );
                        }
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: kOptionA,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: DesignMyOption(
                          myOption: answerA,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (dontTouchTwoTimes == 0) {
                          dontTouchTwoTimes = 1;
                          setState(
                            () {
                              // this conditon is given soo that after the desired
                              // amount of question is done it will move on to the
                              // next page
                              _controller.pause();
                              _controller_tixer.start();
                              if (luckyNumber == 1) {
                                kOptionB = kCallMeGreens;
                                score++;
                              } else {
                                kOptionB = kCallMeReds;

                                if (luckyNumber == 0) {
                                  kOptionA = kCallMeGreens;
                                } else if (luckyNumber == 2) {
                                  kOptionC = kCallMeGreens;
                                } else {
                                  kOptionD = kCallMeGreens;
                                }
                              }
                              if (totalQuestion == 10) {
                                Future.delayed(Duration(seconds: 1));
                                pushMe();
                              }
                            },
                          );
                        }
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: kOptionB,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: DesignMyOption(
                          myOption: answerB,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (dontTouchTwoTimes == 0) {
                          dontTouchTwoTimes = 1;
                          setState(
                            () {
                              // this conditon is given soo that after the desired
                              // amount of question is done it will move on to the
                              // next page
                              _controller.pause();
                              _controller_tixer.start();
                              if (luckyNumber == 2) {
                                kOptionC = kCallMeGreens;
                                score++;
                              } else {
                                kOptionC = kCallMeReds;

                                if (luckyNumber == 0) {
                                  kOptionA = kCallMeGreens;
                                } else if (luckyNumber == 1) {
                                  kOptionB = kCallMeGreens;
                                } else {
                                  kOptionD = kCallMeGreens;
                                }
                              }
                              if (totalQuestion == 10) {
                                Future.delayed(Duration(seconds: 1));
                                pushMe();
                              }
                            },
                          );
                        }
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: kOptionC,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: DesignMyOption(
                          myOption: answerC,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (dontTouchTwoTimes == 0) {
                          dontTouchTwoTimes = 1;
                          setState(
                            () {
                              // this conditon is given soo that after the desired
                              // amount of question is done it will move on to the
                              // next page
                              _controller.pause();
                              _controller_tixer.start();
                              if (luckyNumber == 3) {
                                kOptionD = kCallMeGreens;
                                score++;
                              } else {
                                kOptionD = kCallMeReds;

                                if (luckyNumber == 0) {
                                  kOptionA = kCallMeGreens;
                                } else if (luckyNumber == 1) {
                                  kOptionB = kCallMeGreens;
                                } else {
                                  kOptionC = kCallMeGreens;
                                }
                              }
                              if (totalQuestion == 10) {
                                Future.delayed(Duration(seconds: 2));
                                pushMe();
                              }
                            },
                          );
                        }
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: kOptionD,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: DesignMyOption(
                          myOption: answerD,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ]),
      ),
    );
  }
}

// THIS CLASS IS USED TO GIVE THE DESIGN OF YOUR OPTIONS
class DesignMyOption extends StatelessWidget {
  final int myOption;
  DesignMyOption({required this.myOption});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        myOption.toString(),
        style: TextStyle(
          color: Color(0xFF000000),
          fontSize: 25.0,
          fontWeight: FontWeight.w900,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}
