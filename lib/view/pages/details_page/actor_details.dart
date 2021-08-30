part of '../base.dart';

class DetailsActorScreen extends StatelessWidget {
  late final int id;

  DetailsActorScreen({required this.id});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.30,
            margin: EdgeInsets.symmetric(horizontal: Dimens.margin_global),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CardImageComponent(
                    height: MediaQuery.of(context).size.height * 0.30,
                    width: MediaQuery.of(context).size.width * 0.30,
                    image:
                        'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/cgoy7t5Ve075naBPcewZrc08qGw.jpg'),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextComponent(
                            textcomp: Textcomp.heading4, text: 'Dwayne Johnson'),
                        TextComponent(
                            textcomp: Textcomp.body,
                            text: 'Birthday : 1972-05-02 (49 years old)'),
                        TextComponent(
                            textcomp: Textcomp.body,
                            text: 'Place of Birth : Hayward, California, USAdawdawdawd'),
                        TextComponent(
                            textcomp: Textcomp.body,
                            text: 'Id actor: ' + id.toString()),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: Colors.red,
            height: 40,
            thickness: 2,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: Dimens.margin_global),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextComponent(textcomp: Textcomp.heading4, text: 'Biography'),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: TextComponent(
                      textcomp: Textcomp.body,
                      text:
                          "An American and Canadian actor, producer and semi-retired professional wrestler, signed with WWE. Johnson is half-Black and half-Samoan. His father, Rocky Johnson, is a Black Canadian, from Nova Scotia, and part of the first Black tag team champions in WWE history back when it was known as the WWF along with Tony Atlas. His mother is Samoan and the daughter of Peter Maivia, who was also a pro wrestler. Maivia's wife, Lia Maivia, was one of wrestling's few female promoters, taking over Polynesian Pacific Pro Wrestling after her husband's death in 1982, until 1988. Through his mother, he is considered a non-blood relative of the Anoa'i wrestling family. On March 29, 2008, The Rock inducted his father and his grandfather into the WWE Hall of Fame."),
                ),
                SizedBox(
                  height: 20,
                ),
                TextComponent(textcomp: Textcomp.heading4, text: 'Known For'),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Container(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CardComponent(
                  height: 230,
                  imageurl:
                      'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/wurKlC3VKUgcfsn0K51MJYEleS2.jpg',
                  judul: 'Furious 7',
                  desc: 'Frank Wolff',
                );
              },
              itemCount: 10,
            ),
          )
        ],
      ),
    );
  }
}
