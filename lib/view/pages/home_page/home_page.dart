//extend dari base_page.dart
part of '../base.dart';

//this is for bloc provider, make it easy to read (?)
//CUBIT
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MoviesCubit moviesCubit = MoviesCubit();
    return BlocProvider(
        create: (context) => moviesCubit..initialhomescreen(),
        child: BlocBuilder<MoviesCubit, MoviesState>(
          builder: (context, state) {
            //for testing purpose it will be removed next time
            if (state is MoviesLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is MoviesHomeScreenSuccess) {
              return HomePageview(state.moviespopular, state.moviesNowPlaying,
                  state.moviesToprated, state.moviesUpcoming);
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
  final List<Movie> moviespopular;
  final List<Movie> moviesnowplaying;
  final List<Movie> moviestoprated;
  final List<Movie> moviesupcoming;
  HomePageview(this.moviespopular, this.moviesnowplaying, this.moviestoprated,
      this.moviesupcoming);

  @override
  Widget build(BuildContext context) {
      return CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            expandedHeight: 280,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(child: BlocBuilder<MoviesCubit, MoviesState>(
                builder: (context, state) {
                  return CarouselSlider(
                    options: CarouselOptions(
                        height: double.infinity,
                        autoPlay: true,
                        enlargeCenterPage: false,
                        viewportFraction: 1.0),
                    items: moviespopular.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            child: Stack(
                              children: <Widget>[
                                Image.network(
                                  'https://image.tmdb.org/t/p/w500'+i.posterPath,
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
                                        text: i.title,
                                        textcomp: Textcomp.heading4,
                                      )),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }).toList(),
                  );
                },
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
                          arguments: DetailsArgs(id: moviesnowplaying[index].id));
                    },
                    child: CardComponent(
                        imageurl:
                            'https://image.tmdb.org/t/p/w500' + moviesnowplaying[index].posterPath,
                        judul: moviesnowplaying[index].title,
                        desc: moviesnowplaying[index].releaseDate),
                  );
                },
                itemCount: moviesnowplaying.length,
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
                              'https://image.tmdb.org/t/p/w500'+moviesupcoming[index].posterPath,
                          judul: moviesupcoming[index].title,
                          desc: moviesupcoming[index].releaseDate);
                    },
                    itemCount: moviesupcoming.length,
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
                              'https://image.tmdb.org/t/p/w500'+moviestoprated[index].posterPath,
                          judul: moviestoprated[index].title,
                          desc: moviestoprated[index].releaseDate);
                    },
                    itemCount: moviestoprated.length,
                  )))
        ],
      );
    }
  }