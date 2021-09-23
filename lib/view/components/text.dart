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
  final int? maxlines;
  
  late final String text;

  ///fontsize hanya untuk textcomp == body
  final double? fontsize;

  TextComponent({required this.textcomp, required this.text, this.fontsize,this.maxlines});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxlines,
      overflow: (maxlines!=null)?TextOverflow.ellipsis : null,
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