part of 'base.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final listchoice = <Itemchoice>[
    Itemchoice(1, 'Movies'),
    Itemchoice(2, 'Tv'),
    Itemchoice(3, 'Actor')
  ];

  int choiceselected = 0;

  @override
  Widget build(BuildContext context) {
    TextEditingController _search = TextEditingController();
    return Scaffold(
      body: Column(children: [
        Container(
            margin: EdgeInsets.symmetric(horizontal: Dimens.margin_global),
            child: Column(children: [
              Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Textformfieldcomponent(
                    hint: 'search',
                    controller: _search,
                    suffix: ButtonComponent(
                      function: null,
                      buttonComponentStyle: ButtonComponentStyle.ButtonIcon,
                      iconData: Icons.search,
                    ),
                  )),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: listchoice
                    .map((e) => ChoiceChip(
                          label: Text(e.label),
                          selected: choiceselected == e.index,
                          onSelected: (_) =>
                              setState(() => choiceselected = e.index),
                        ))
                    .toList(),
              )
            ])),
        Divider(
          thickness: 2,
          color: Colors.red,
        ),
        Flexible(
            child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return Card2component(
                margin: EdgeInsets.symmetric(vertical: 2),
                title: 'The Quite Place part II',
                desc: 'Action, Thriller, Horror',
                imageurl:
                    'https://image.tmdb.org/t/p/w500/9dKCd55IuTT5QRs989m9Qlb7d2B.jpg');
          },
          itemCount: 10,
        ))
      ]),
    );
  }
}

//model for item choise
class Itemchoice {
  final int index;
  final String label;
  Itemchoice(this.index, this.label);
}
