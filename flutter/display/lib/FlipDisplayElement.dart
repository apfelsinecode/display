import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rolodex/rolodex.dart';

class FlipDisplayLetter extends StatelessWidget {

  final List<String> letterList;
  final String letter;

  FlipDisplayLetter({required this.letterList, required this.letter});

  @override
  Widget build(BuildContext context) {
    int goalIndex = max(0, letterList.indexOf(letter));
    return TweenAnimationBuilder(
        tween: IntTween(begin: 0, end: goalIndex),
        duration: Duration(seconds: 3),
        builder: (_, int index, __) {
          return Rolodex(
            child: Text(
              letterList[index],
              style: TextStyle(fontSize: 48),
            ),
            value: index,
            theme: RolodexThemeData(mode: RolodexMode.splitFlap),
          );
        }
    );
  }

}