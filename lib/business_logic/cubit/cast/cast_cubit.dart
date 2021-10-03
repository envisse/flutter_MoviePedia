import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie_blocpattern/data/models/CastMovie.dart';
import 'package:flutter_movie_blocpattern/data/models/CastPeople.dart';
import 'package:flutter_movie_blocpattern/data/repository/CastRepository.dart';

part 'cast_state.dart';

class CastCubit extends Cubit<CastState> {
  CastRepository castRepository = CastRepository();
  CastCubit() : super(CastInitial());

  void initCastPeople(int id) async{
    emit(CastLoading());
    try {
      CastPeople? fetch = await castRepository.getCastDataPeople(id);
      if (fetch !=null) {
        emit(CastSuccessPeople(fetch));
      } else {
        emit(CastError('data not found'));
      }
    } catch (e) {
      emit(CastError(e.toString()));
    }
  }

  void initCastMovie(int id) async{
    emit(CastLoading());
    try {
      CastMovie? fetch = await castRepository.getCastDataMovie(id);
      if (fetch != null) {
        emit(CastSuccessMovie(fetch));
      } else {
      }
    } catch (e) {
      emit(CastError(e.toString()));
    }
  }
}
