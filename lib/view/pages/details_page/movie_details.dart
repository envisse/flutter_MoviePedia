part of '../base.dart';

class DetailMoviePage extends StatelessWidget {
  final int id;
  const DetailMoviePage(this.id);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MoviesCubit()..initmoviedetail(id),
        ),
        BlocProvider(
          create: (context) => CastCubit()..initCastPeople(id),
        ),
      ],
      child: BlocBuilder<MoviesCubit, MoviesState>(
        builder: (context, state) {
          if (state is MoviesLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is MovieSuccess) {
            var moviedetail = state.moviedetail;

            return BlocBuilder<CastCubit, CastState>(
              builder: (context, state) {
                if (state is CastLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is CastSuccessPeople) {
                  return DetailsMovieView(moviedetail, state.castdata);
                } else {
                  return Text('something wrong in cast');
                }
              },
            );
          } else if (state is MoviesError) {
            return Center(child: Text(state.error));
          }
          return Text('something wrong in movie');
        },
      ),
    );
  }
}

class DetailsMovieView extends StatelessWidget {
  final Movie _moviedata;
  final CastPeople _castdata;

  const DetailsMovieView(this._moviedata, this._castdata);
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
                    width: MediaQuery.of(context).size.width * 0.35,
                    image: 'https://image.tmdb.org/t/p/w500/' +
                        _moviedata.posterPath),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextComponent(
                          textcomp: Textcomp.heading3, text: _moviedata.title),
                      Wrap(
                        children: List.generate(
                            _moviedata.genres!.length,
                            (index) => TextComponent(
                                textcomp: Textcomp.body,
                                text: (index != _moviedata.genres!.length - 1)
                                    ? _moviedata.genres![index].name + ', '
                                    : _moviedata.genres![index].name)),
                      ),
                      TextComponent(
                          textcomp: Textcomp.body,
                          text: 'Duration : ' + _moviedata.duration.toString()),
                      TextComponent(
                          textcomp: Textcomp.body,
                          text: 'Release Date: ' + _moviedata.releaseDate!),
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
                    textcomp: Textcomp.body, text: _moviedata.overview.toString()),
                SizedBox(
                  height: 20,
                ),
                TextComponent(textcomp: Textcomp.heading4, text: 'Cast'),
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
                        arguments: DetailsArgs(id: _castdata.cast[index].id));
                  },
                  child: CardComponent(
                    height: 230,                  
                    imageurl:
                    (_castdata.cast[index].profilePath != null) ? 
                        'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/${_castdata.cast[index].profilePath}' : null,
                    judul: _castdata.cast[index].name, //realname
                    desc: _castdata.cast[index].character, //as
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
