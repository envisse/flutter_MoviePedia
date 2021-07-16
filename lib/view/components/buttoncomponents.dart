import 'package:flutter/material.dart';

//for containedbutton
class ButtonContainedcomponent extends StatelessWidget {
  late final String text;
  final void Function()? function;

  ButtonContainedcomponent(
      {Key? key, required this.function, required this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(text),
      onPressed: function,
    );
  }
}

//for outlined button
class ButtonOutlinedComponent extends StatelessWidget {
  late final String text;
  final void Function()? function;

  ButtonOutlinedComponent(
      {Key? key, required this.function, required this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: function,
      child: Text(text),
    );
  }
}
