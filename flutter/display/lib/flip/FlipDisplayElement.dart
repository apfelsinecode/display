import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rolodex/rolodex.dart';

class FlipDisplayLetter extends StatefulWidget {

  final List<String> alphabet;
  final String letter;

  FlipDisplayLetter({required this.alphabet, required this.letter});

  @override
  _FlipDisplayLetterState createState() => _FlipDisplayLetterState();
}

class _FlipDisplayLetterState extends State<FlipDisplayLetter> {

  var _duration = Duration(seconds: 1);
  var _goalIndex = 0;

  @override
  Widget build(BuildContext context) {
    // int goalIndex = max(0, widget.alphabet.indexOf(widget.letter));
    return TweenAnimationBuilder(
        tween: IntTween(begin: 0, end: _goalIndex),
        duration: _duration,
        builder: (_, int index, __) {
          return Rolodex(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all()
              ),
              child: SizedBox(
                width: 42,
                child: Center(
                  child: Text(
                    widget.alphabet[index],
                    style: TextStyle(fontSize: 48),
                  ),
                ),
              ),
            ),
            value: index,
            theme: RolodexThemeData(mode: RolodexMode.splitFlap),
          );
        }
    );
  }

  @override
  void didUpdateWidget(covariant FlipDisplayLetter oldWidget) {
    final int oldIndex = _goalIndex;
    _goalIndex = max(0, widget.alphabet.indexOf(widget.letter));
    _duration = Duration(milliseconds: (_goalIndex - oldIndex).abs() * 125);
    //print(_duration);
    super.didUpdateWidget(oldWidget);
  }
}