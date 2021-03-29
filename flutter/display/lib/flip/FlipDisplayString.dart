

import 'dart:math';

import 'package:display/flip/FlipDisplayElement.dart';
import 'package:flutter/material.dart';

enum FlipTextAlign {
  left, center, right
}

class FlipDisplayString extends StatelessWidget {

  final int length;
  /// letters can have any length
  ///
  /// [alphabet][0] is used as space character
  final List<String> alphabet;
  /// letter should be elements from [alphabet]
  late final List<String> characters;
  final FlipTextAlign textAlign;

  FlipDisplayString({
    required this.length,
    required this.alphabet,
    required List<String> characters,
    this.textAlign = FlipTextAlign.left
  }) {
    if (characters.length == this.length) {
      this.characters = characters;
    } else {
      var newText = <String>[for (int i = 0; i < this.length; i++) ' '];
      switch (this.textAlign) {
        case FlipTextAlign.left:
          for (int i = 0; i < min(this.length, characters.length); i++) {
            newText[i] = characters[i];
          }
          break;
        case FlipTextAlign.center:
        // TODO: Handle this case.
          throw UnimplementedError();
          break;
        case FlipTextAlign.right:
          throw UnimplementedError();
        // TODO: Handle this case.
          break;
      }
      this.characters = newText;
    }
  }

  FlipDisplayString.numeric({required int length, required int text}) :
      this(
          length: length,
          characters: text.toString().split(''),
          alphabet: [' ', '.', '-', for (int i = 0; i <= 9; i++) i.toString()]
      );
  FlipDisplayString.alphanumeric({
    required int length, required String text, List<String>? extraCharacters,
  }) :
    this(
      length: length,
      characters: text.split(''),
      alphabet: [
        ' ',
        for (int i = 'A'.codeUnitAt(0); i <= 'Z'.codeUnitAt(0); i++) String.fromCharCode(i),
        for (int i = 'a'.codeUnitAt(0); i <= 'z'.codeUnitAt(0); i++) String.fromCharCode(i),
        for (int i = 0; i <= 9; i++) i.toString(),
        if (extraCharacters != null) for (var c in extraCharacters) c
      ]
    );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < length; i++)
          FlipDisplayLetter(
              alphabet: alphabet,
              letter: characters[i]
          )
      ],
    );
  }
}
