import 'package:flutter/material.dart';

//heading 1
class Textheading1 extends StatelessWidget {
  late final String text;

  Textheading1({required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline1,
    );
  }
}

//heading 2
class Textheading2 extends StatelessWidget {
  late final String text;
  Textheading2({required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline2,
    );
  }
}

//heading 3
class Textheading3 extends StatelessWidget {
  late final String text;
  Textheading3({required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline3,
      
    );
  }
}

//heading 4
class Textheading4 extends StatelessWidget {
  late final String text;
  Textheading4({required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

//body
class Textbody extends StatelessWidget {
  late final String text;
  final double? fontsize;
  Textbody({required this.text, this.fontsize});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .bodyText1!
          .copyWith(fontSize: fontsize ?? 14),
    );
  }
}
