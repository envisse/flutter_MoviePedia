import 'package:flutter/material.dart';
import 'package:flutter_movie_blocpattern/view/shared/dimens.dart';

//all style in here
enum Textcomp {
  heading1,
  heading2,
  heading3,
  heading4,
  body,
}

class TextComponent extends StatelessWidget {
  final Textcomp textcomp;
  late final String text;

  ///fontsize hanya untuk textcomp == body
  final double? fontsize;

  TextComponent({required this.textcomp, required this.text, this.fontsize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      // if-else approach in non-function type request
      style: textcomp == Textcomp.heading1
          ? Theme.of(context).textTheme.headline1
          : textcomp == Textcomp.heading2
              ? Theme.of(context).textTheme.headline2
              : textcomp == Textcomp.heading3
                  ? Theme.of(context).textTheme.headline3
                  : textcomp == Textcomp.heading4
                      ? Theme.of(context).textTheme.headline4
                      : textcomp == Textcomp.body
                          ? Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: fontsize ?? Dimens.size_body)
                          : Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: fontsize ?? Dimens.size_body),
    );
  }
}

// BAD IDEA
// based on FontWeight class in flutter (built in)
// To much recruitment for doing this approach
// class _TextComponentStyle {
//   final int index;
//   const _TextComponentStyle._(this.index);

//   static const _TextComponentStyle heading1 = _TextComponentStyle._(1);
//   static const _TextComponentStyle heading2 = _TextComponentStyle._(2);
//   static const _TextComponentStyle heading3 = _TextComponentStyle._(3);

//   static const List<_TextComponentStyle> values = <_TextComponentStyle>[
//     heading1,
//     heading2,
//     heading3
//   ];

//   String toString() {
//     return const <int, String>{
//       1: 'Theme.of(context).textTheme.headline1',
//       2: 'Theme.of(context).textTheme.headline2',
//       3: 'Theme.of(context).textTheme.headline3',
//     }[index]!;
//   }
// }