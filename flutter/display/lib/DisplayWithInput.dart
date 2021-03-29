

import 'package:display/flip/FlipDisplayString.dart';
import 'package:flutter/material.dart';

class DisplayWithInput extends StatefulWidget {
  @override
  _DisplayWithInputState createState() => _DisplayWithInputState();
}

class _DisplayWithInputState extends State<DisplayWithInput> {
  String _text = "";
  TextEditingController _controller = TextEditingController();


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        FlipDisplayString.alphanumeric(
            length: 32,
            text: _text,// _controller.text,
          extraCharacters: ['Ä', 'Ö', 'Ü', 'ä', 'ö', 'ü', 'ß',
            '.', ',', '!', '?', ':', '/', '(', ')'],
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            // controller: _controller,
            onChanged: (s) {
              //print(s);
              //_controller.text = s;
              setState(() {
                _text = s;
              });
            },
          ),
        )


      ],
    );
  }
}
