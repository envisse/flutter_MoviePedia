part of '../base.dart';

class DetailsActorScreen extends StatelessWidget {
  late final int id;

  DetailsActorScreen({required this.id});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PeopleCubit()..initialPeopleDetail(id),
        ),
        BlocProvider(
          create: (context) => CastCubit()..initCastMovie(id),
        ),
      ],
      child: BlocBuilder<PeopleCubit, PeopleState>(
        builder: (context, state) {
          if (state is PeopleLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PeopleSuccess) {
            return DetailsActorPage(state.people);
          } else if (state is PeopleError) {
            return Center(
              child: Text(state.message),
            );
          }
          return Text('something wrong');
        },
      ),
    );
  }
}

class DetailsActorPage extends StatelessWidget {
  late final People _people;

  DetailsActorPage(this._people);

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
                    width: MediaQuery.of(context).size.width * 0.40,
                    image: (_people.profilePath != null)
                        ? 'https://www.themoviedb.org/t/p/w500/${_people.profilePath}'
                        : null),
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
                            textcomp: Textcomp.heading3, text: _people.name),
                        TextComponent(
                            textcomp: Textcomp.body,
                            text: 'Born Date : ${_people.birthday}'),
                        TextComponent(
                            textcomp: Textcomp.body,
                            text: 'Place of Birth : ${_people.placeOfBirth}'),
                        TextComponent(
                            textcomp: Textcomp.body,
                            text: 'Gender: ${_people.gender}'),
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
                      text: _people.biography.toString()),
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
          BlocBuilder<CastCubit, CastState>(
            builder: (context, state) {
              if (state is CastLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is CastSuccessMovie) {
                return Container(
                  height: 250,
                  child: ListView.builder(                  
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        // onTap: () {
                        //   Navigator.pushNamed(
                        //     context,
                        //     '/movie_detail',
                        //     arguments: DetailsArgs(id: 1),
                        //   );
                        // },
                        child: CardComponent(
                          height: 230,
                          imageurl: (state.castMovie.movies[index].posterPath !=
                                  null)
                              ? 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/${state.castMovie.movies[index].posterPath}'
                              : null,
                          judul: state.castMovie.movies[index].title,
                          desc: state.castMovie.movies[index].releaseDate,
                        ),
                      );
                    },
                    itemCount: state.castMovie.movies.length > 10 ? 10 : state.castMovie.movies.length,
                  ),
                );
              } else if (state is CastError) {
                return Text(state.error);
              }
              return Text('Nothing');
            },
          )
        ],
      ),
    );
  }
}
