part of '../base.dart';

enum DetailsPageList {
  movie,
  actor,
}

class DetailsPage extends StatelessWidget {
  final DetailsPageList pageList;
  final int id;
  const DetailsPage({Key? key, required this.pageList, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (pageList == DetailsPageList.actor) {
      return DetailsActorScreen(id: id);
    } else if (pageList == DetailsPageList.movie) {
      return DetailsMovieScreen(id: id,);
    } else {
      return Text('page not found');
    }
  }
}
