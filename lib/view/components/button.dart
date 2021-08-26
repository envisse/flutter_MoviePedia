import 'package:flutter/material.dart';

enum ButtonComponentStyle {
  ButtonContained,
  ButtonOutlined,
  ButtonText,
}

class ButtonComponent extends StatelessWidget {
  late final String text;
  final void Function()? function;
  final ButtonComponentStyle buttonComponentStyle;

  ButtonComponent(
      {required this.text,
      required this.function,
      required this.buttonComponentStyle});

  @override
  Widget build(BuildContext context) {
    if (buttonComponentStyle == ButtonComponentStyle.ButtonContained) {
      return ElevatedButton(onPressed: function, child: Text(text));
    } else if (buttonComponentStyle == ButtonComponentStyle.ButtonOutlined) {
      return OutlinedButton(onPressed: function, child: Text(text));
    } else if (buttonComponentStyle == ButtonComponentStyle.ButtonText) {
      return TextButton(onPressed: function, child: Text(text));
    } else {
      return Text('button components not found');
    }
  }
}
