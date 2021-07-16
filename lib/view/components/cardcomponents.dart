import 'package:flutter/material.dart';
import 'package:flutter_movie_blocpattern/view/components/textcomponents.dart';

class CardComponent extends StatelessWidget {
  late final double width;
  late final double height;
  late final String imageurl;
  late final String judul;
  late final String date;

  CardComponent({
    required this.width,
    required this.height,
    required this.imageurl,
    required this.judul,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white12),
      width: width,
      height: height,
      child: Column(
        children: [
          Container(
            height: height * 0.75,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.network(
                imageurl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Align(
                alignment: Alignment.topLeft,
                child: Textbody(
                  text: judul,
                )),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Align(
                alignment: Alignment.topLeft,
                child: Textbody(
                  text: date,
                  fontsize: 11,
                )),
          ),
        ],
      ),
    );
  }
}
