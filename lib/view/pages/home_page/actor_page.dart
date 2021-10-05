part of '../base.dart';

// TODO : make actor screen
class Actorpage extends StatelessWidget {
  const Actorpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PeopleCubit()..initialPeoples(1),
      child: BlocBuilder<PeopleCubit, PeopleState>(
        builder: (context, state) {
          if (state is PeopleLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PeoplesSuccess) {
            return ActorView();
          } else if (state is PeopleError) {
            return Center(child: Text(state.message));
          }
          return Center(child: Text('data'));
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class ActorView extends StatelessWidget {
  int page = 2;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          BlocBuilder<PeopleCubit, PeopleState>(
            builder: (context, state) {
              if (state is PeoplesSuccess) {
                return Wrap(
                  spacing: 1,
                  runSpacing: 20,
                  children: List.generate(
                      state.peoples.length,
                      (index) => GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/person_detail',
                                arguments:
                                    DetailsArgs(id: state.peoples[index].id));
                          },
                          child: CardComponent(
                            judul: state.peoples[index].name,
                            desc: state.peoples[index].id.toString(),
                            imageurl: (state.peoples[index].profilePath != null)
                                ? 'https://www.themoviedb.org/t/p/w500/${state.peoples[index].profilePath}'
                                : null,
                            width: MediaQuery.of(context).size.width * 0.28,
                            height: MediaQuery.of(context).size.height * 0.25,
                          ))),
                );
              }
              return Actorpage();
            },
          ),
          BlocBuilder<PeopleCubit, PeopleState>(
            builder: (context, state) {
              if (state is PeoplesSuccess) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonComponent(
                      function: (state.pagenumber == 1)
                          ? null
                          : () {
                              context
                                  .read<PeopleCubit>()
                                  .initialPeoples(state.pagenumber - 1);
                            },
                      buttonComponentStyle: ButtonComponentStyle.ButtonText,
                      text: 'Previous',
                    ),
                    Text(state.pagenumber.toString()),
                    ButtonComponent(
                      function: () {
                        context
                            .read<PeopleCubit>()
                            .initialPeoples(state.pagenumber + 1);
                      },
                      buttonComponentStyle: ButtonComponentStyle.ButtonText,
                      text: 'Next',
                    )
                  ],
                );
              }
              return Actorpage();
            },
          )
        ],
      ),
    );
  }
}
