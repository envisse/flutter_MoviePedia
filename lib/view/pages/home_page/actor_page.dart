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
            return Center(child: Text('success fetch data'));
          } else if (state is PeopleError) {
            return Center(child: Text(state.message));
          }
          return Center(child: Text('data'));
        },
      ),
    );
  }
}

// class ActorView extends StatelessWidget {
//   final List<People> _peoples;

//   ActorView(this._peoples);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: BlocBuilder<PeopleCubit, PeopleState>(builder: (context, state) {
//           return Wrap(
//               spacing: 1,
//               runSpacing: 20,
//               children: List.generate(
//                   _peoples.length,
//                   (index) => CardComponent(
//                         judul: _peoples[index].name,
//                         desc: null,
//                         width: MediaQuery.of(context).size.width * 0.28,
//                         height: MediaQuery.of(context).size.height * 0.22,
//                       )));
//         }));
//   }
// }