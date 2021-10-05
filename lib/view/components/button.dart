import 'package:flutter/material.dart';

enum ButtonComponentStyle {
  ButtonContained,
  ButtonOutlined,
  ButtonText,
  ButtonIcon,
}

class ButtonComponent extends StatelessWidget {
  final String? text;
  final void Function()? function;
  final ButtonComponentStyle buttonComponentStyle;
  final IconData? iconData;

  ButtonComponent(
      {this.text,
      required this.function,
      required this.buttonComponentStyle,
      this.iconData});

  @override
  Widget build(BuildContext context) {
    if (buttonComponentStyle == ButtonComponentStyle.ButtonContained) {
      return ElevatedButton(onPressed: function, child: Text(text.toString()));
    } else if (buttonComponentStyle == ButtonComponentStyle.ButtonOutlined) {
      return OutlinedButton(onPressed: function, child: Text(text.toString()));
    } else if (buttonComponentStyle == ButtonComponentStyle.ButtonText) {
      return TextButton(onPressed: function, child: Text(text.toString()));
    } else if (buttonComponentStyle == ButtonComponentStyle.ButtonIcon) {
      return IconButton(onPressed: function, icon: Icon(iconData));
    } else {
      return Text('button components not found');
    }
  }
}
