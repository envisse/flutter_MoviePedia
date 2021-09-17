//extend dari base_page.dart
part of '../base.dart';

//this is for bloc provider, make it easy to read (?)
//CUBIT
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MoviesCubit()..initialhomescreen(),
        child: BlocBuilder<MoviesCubit, MoviesState>(
          builder: (context, state) {
            //for testing purpose it will be removed next time
            if (state is MoviesLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is MoviesHomeScreenSuccess) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('this is Cubit'),
                    Text('length moviesNowPlaying is ' +
                        state.moviesNowPlaying.length.toString()),
                    Text('length moviesToprated is ' +
                        state.moviesToprated.length.toString()),
                    Text('length moviesUpcoming is ' +
                        state.moviesUpcoming.length.toString()),
                  ],
                ),
              );
            } else if (state is MoviesError) {
              return Center(child: Text(state.error));
            }
            return Text('something wrong in bloc');
          },
        ));
  }
}

class HomePageview extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: [
        SliverAppBar(
          floating: true,
          pinned: true,
          snap: false,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
                child: CarouselSlider(
              options: CarouselOptions(
                  height: double.infinity,
                  autoPlay: true,
                  enlargeCenterPage: false,
                  viewportFraction: 1.0),
              items: imgList.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      child: Stack(
                        children: <Widget>[
                          Image.network(
                            i,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                          Positioned(
                            bottom: 0.0,
                            left: 0.0,
                            right: 0.0,
                            child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(200, 0, 0, 0),
                                      Color.fromARGB(0, 0, 0, 0)
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 10),
                                child: TextComponent(
                                  text: 'Movie ${imgList.indexOf(i)} image',
                                  textcomp: Textcomp.heading4,
                                )),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
            )),
          ),
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu),
              tooltip: 'Menu',
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          actions: <Widget>[
            ButtonComponent(
              function: () {
                Navigator.pushNamed(context, '/search');
              },
              buttonComponentStyle: ButtonComponentStyle.ButtonIcon,
              iconData: Icons.search,
            )
          ],
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
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/movie_detail',
                        arguments: DetailsArgs(id: index));
                  },
                  child: CardComponent(
                      imageurl:
                          'https://image.tmdb.org/t/p/w500/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg',
                      judul: 'The walking dead',
                      desc: '3 jan 2020'),
                );
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
    );
  }
}

//imagelist
final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];
