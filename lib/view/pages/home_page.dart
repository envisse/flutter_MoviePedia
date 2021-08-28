//extend dari base_page.dart
part of 'base.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            expandedHeight: 100,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                margin: EdgeInsets.all(20),
                child: ElevatedButton(
                    onPressed: () {
                      print('object');
                    },
                    child: Text('widget in sliverappbar')),
              ),
            ),
            leading: Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.menu),
                tooltip: 'Menu',
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                tooltip: 'Comment Icon',
                onPressed: () {},
              ), //IconButton //IconButton
            ], //
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                    alignment: Alignment.centerLeft,
                    child: TextComponent(
                      text: 'Now Playing',
                      textcomp: Textcomp.heading4,
                    ),
                  ),
                  Divider(
                    height: 20,
                    color: Dimens.color_primary,
                    thickness: 2,
                  ),
                ],
              ),
            )
          ])),
          SliverToBoxAdapter(
            child: Container(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CardComponent(
                      imageurl:
                          'https://image.tmdb.org/t/p/w500/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg',
                      judul: 'The walking dead',
                      desc: '3 jan 2020');
                },
                itemCount: 6,
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                    alignment: Alignment.centerLeft,
                    child: TextComponent(
                      text: 'Upcoming',
                      textcomp: Textcomp.heading4,
                    ),
                  ),
                  Divider(
                    height: 20,
                    color: Dimens.color_primary,
                    thickness: 2,
                  ),
                ],
              ),
            ),
          ])),
          SliverToBoxAdapter(
              child: Container(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CardComponent(
                          imageurl:
                              'https://image.tmdb.org/t/p/w500/acCS12FVUQ7blkC8qEbuXbsWEs2.jpg',
                          judul: 'The walking dead',
                          desc: '3 jan 2020');
                    },
                    itemCount: 6,
                  ))),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                    alignment: Alignment.centerLeft,
                    child: TextComponent(
                      text: 'Top Rated',
                      textcomp: Textcomp.heading4,
                    ),
                  ),
                  Divider(
                    height: 20,
                    color: Dimens.color_primary,
                    thickness: 2,
                  ),
                ],
              ),
            ),
          ])),
          SliverToBoxAdapter(
              child: Container(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CardComponent(
                          imageurl:
                              'https://image.tmdb.org/t/p/w500/9dKCd55IuTT5QRs989m9Qlb7d2B.jpg',
                          judul: 'The walking dead',
                          desc: '3 jan 2020');
                    },
                    itemCount: 6,
                  )))
        ],
      ),
      bottomNavigationBar: Bottomnavigationbar(),
      drawer: DrawerComponennts(),
    );
  }
}
