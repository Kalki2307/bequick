import 'package:flutter/material.dart';


//A simple transition class to give transtion to routes


class DoTransition extends PageRouteBuilder {
  final Widget page;

  DoTransition(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: Duration(milliseconds: 550),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
              curve: Curves.ease,
              parent: animation,
            );
            return Align(
              alignment: Alignment.topLeft,
              child: SizeTransition(
                sizeFactor: animation,
                child: page,
                axisAlignment:0,
              ),
            );
          },
        );
}
