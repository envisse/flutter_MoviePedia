part of '../base.dart';

class DetailMoviePage extends StatelessWidget {
  final int id;
  const DetailMoviePage(this.id);

  @override
  Widget build(BuildContext context) {
    MoviesCubit moviesCubit = MoviesCubit();
    return BlocProvider(
      create: (context) => moviesCubit..initmoviedetail(id),
      child: BlocBuilder<MoviesCubit, MoviesState>(
        builder: (context, state) {
          if (state is MoviesLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is MovieSuccess) {
            return DetailsMovieView();
          } else if (state is MoviesError) {
            return Center(child: Text(state.error));
          }
          return Text('something wrong in bloc');
        },
      ),
    );
  }
}

class DetailsMovieView extends StatelessWidget {
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
                        'https://image.tmdb.org/t/p/w500/acCS12FVUQ7blkC8qEbuXbsWEs2.jpg'),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextComponent(
                          textcomp: Textcomp.heading4,
                          text: 'The Quite Place part II'),
                      TextComponent(
                          textcomp: Textcomp.body,
                          text: 'Action, thriller, horror'),
                      TextComponent(textcomp: Textcomp.body, text: '1h 41m'),
                      TextComponent(textcomp: Textcomp.body, text: 'Id film: '),
                    ],
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
                TextComponent(textcomp: Textcomp.heading4, text: 'Overview'),
                SizedBox(
                  height: 20,
                ),
                TextComponent(
                    textcomp: Textcomp.body,
                    text:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'),
                SizedBox(
                  height: 20,
                ),
                TextComponent(
                    textcomp: Textcomp.heading4, text: 'Top Billed Cast'),
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
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/person_detail',
                        arguments: DetailsArgs(id: index));
                  },
                  child: CardComponent(
                    height: 230,
                    imageurl:
                        'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/cgoy7t5Ve075naBPcewZrc08qGw.jpg',
                    judul: 'Dwayne Johnson',
                    desc: 'Frank Wolff',
                  ),
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
