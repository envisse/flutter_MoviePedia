import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie_blocpattern/data/models/People.dart';
import 'package:flutter_movie_blocpattern/data/repository/PeopleRepository.dart';

part 'people_state.dart';

class PeopleCubit extends Cubit<PeopleState> {
  PeopleCubit() : super(PeopleInitial());

  PeopleRepository _peopleRepository = PeopleRepository();
  void initialPeopleDetail(int id) async {
    emit(PeopleLoading());
    try {
      People? fetchdata = await _peopleRepository.getPeopleData(id);
      (fetchdata != null)
          ? emit(PeopleSuccess(fetchdata))
          : emit(PeopleError('Data not found'));
    } catch (e) {
      emit(PeopleError(e.toString()));
    }
  }

  void initialPeoples(int page) async {
    emit(PeopleLoading());
    try {
      List<People>? fetchdata = await _peopleRepository.getPeoplesData(page);
      (fetchdata != null)
          ? emit(PeoplesSuccess(peoples: fetchdata, pagenumber: page))
          : emit(PeopleError('Data not found'));
    } catch (e) {
      emit(PeopleError(e.toString()));
    }
  }
}
