import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rolodex/rolodex.dart';

class FlipDisplayLetter extends StatelessWidget {

  final List<String> alphabet;
  final String letter;

  FlipDisplayLetter({required this.alphabet, required this.letter});

  @override
  Widget build(BuildContext context) {
    int goalIndex = max(0, alphabet.indexOf(letter));
    return TweenAnimationBuilder(
        tween: IntTween(begin: 0, end: goalIndex),
        duration: Duration(seconds: 1),
        builder: (_, int index, __) {
          return Rolodex(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all()
              ),
              child: FittedBox(
                child: Text(
                  alphabet[index],
                  style: TextStyle(fontSize: 48),
                ),
              ),
            ),
            value: index,
            theme: RolodexThemeData(mode: RolodexMode.splitFlap),
          );
        }
    );
  }

}