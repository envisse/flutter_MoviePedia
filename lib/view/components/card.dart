import 'package:flutter/material.dart';
import 'package:flutter_movie_blocpattern/view/components/text.dart';

class CardComponent extends StatelessWidget {
  late final double? width;
  late final double? height;
  late final String imageurl;
  late final String judul;
  late final String? desc;

  CardComponent({
    this.width,
    this.height,
    required this.imageurl,
    required this.judul,
    this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white12),
      width: width ?? 160,
      height: height ?? 250,
      child: Container(
        child: Column(
          children: [
            Container(
              height: height == null ? 250 * 0.75 : height! * 0.75,
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
                child: TextComponent(textcomp: Textcomp.body, text: judul),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: TextComponent(textcomp: Textcomp.body, text: desc ?? ''),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///This card style are using image with 2 text beside it
class Card2component extends StatelessWidget {
  late final String title;
  late final String desc;
  late final String imageurl;

  ///by default margin in any direction value is 4.0
  final EdgeInsets? margin;

  ///this width is for image
  final double? width;

  ///this width is for image
  final double? height;

  Card2component(
      {Key? key,
      required this.title,
      required this.desc,
      required this.imageurl,
      this.margin,
      this.width,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin ?? EdgeInsets.all(4.0),
      color: Colors.white12,
      elevation: 1,
      child: Row(
        children: [
          Container(
            width: width ?? 70,
            height: height ?? 100,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  bottomLeft: Radius.circular(4.0)),
              child: Image.network(
                imageurl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextComponent(textcomp: Textcomp.heading4, text: title),
              SizedBox(
                height: 5,
              ),
              TextComponent(textcomp: Textcomp.body, text: desc)
            ],
          )
        ],
      ),
    );
  }
}

///this card is for dispalying image only with BorderRaidus.all = 10
class CardImageComponent extends StatelessWidget {
  final double? height;
  final double? width;
  final String image;
  const CardImageComponent({Key? key, required this.image, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
      height: height??250,
      width: width??160,
      child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          child: Image.network(
            image,
            fit: BoxFit.fill,
          )),
    );
  }
}
