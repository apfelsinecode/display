

import 'package:flutter/material.dart';

class FlipDisplayString extends StatelessWidget {

  final int length;
  /// letters can have any length
  final List<String> alphabet;
  /// letter should be elements from [alphabet]
  final List<String> text;


  FlipDisplayString({required this.length, required this.alphabet, required this.text});

  FlipDisplayString.numeric({required length, required text}) :
      this(length: length, text: text, alphabet: [' ', '.', for (int i = 0; i <= 9; i++) i.toString()]);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
