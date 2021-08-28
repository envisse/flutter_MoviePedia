part of 'base.dart';

///this file will contain 3 page
// tv, movie, and person
enum PageList { tv, movie, person }

//this is page ?
class SpesificPage extends StatelessWidget {
  final PageList page;
  const SpesificPage({Key? key, required this.page});

  @override
  Widget build(BuildContext context) {
    if (page == PageList.movie) {
      return SpesificScreen(pagename: 'Movie', content: 'This is movie page');
    } else if (page == PageList.tv) {
      return SpesificScreen(pagename: 'Tv', content: 'This is tv page');
    } else if (page == PageList.person) {
      return SpesificScreen(pagename: 'Person', content: 'This is person page');
    } else {
      return Text('Page not found');
    }
  }
}

//this is screen ?
class SpesificScreen extends StatelessWidget {
  final String pagename;
  final String content;
  const SpesificScreen(
      {Key? key, required this.pagename, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pagename),
        actions: [
          ButtonComponent(
              function: () {},
              iconData: Icons.search,
              buttonComponentStyle: ButtonComponentStyle.ButtonIcon)
        ],
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Card2component(
              title: 'The Quite Place part II',
              desc: 'Action, Thriller, Horror',
              imageurl:
                  'https://image.tmdb.org/t/p/w500/9dKCd55IuTT5QRs989m9Qlb7d2B.jpg');
        },
        itemCount: 20,
      ),
    );
  }
}
