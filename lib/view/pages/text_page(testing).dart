import 'package:flutter/material.dart';
import 'package:flutter_movie_blocpattern/view/components/text.dart';

class Textpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextTheming'),
      ),
      body: Column(
        children: [
          Textheading1(text: 'Heading 1'),
          Textheading2(text: 'Heading 2'),
          Textheading3(text: 'Heading 3'),
          Textheading4(text: 'Heading 4'),
          Textbody(text: 'Body')
        ],
      ),
    );
  }
}
