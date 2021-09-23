import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie_blocpattern/data/models/Cast.dart';
import 'package:flutter_movie_blocpattern/data/repository/CastRepository.dart';

part 'cast_state.dart';

class CastCubit extends Cubit<CastState> {
  CastRepository castRepository = CastRepository();
  CastCubit() : super(CastInitial());

  void initcast(int id) async{
    emit(CastLoading());
    try {
      Cast? fetchcast = await castRepository.getCastData(id);
      if (fetchcast !=null) {
        emit(CastSuccess(fetchcast));
      } else {
        emit(CastError('data not found'));
      }
    } catch (e) {
      emit(CastError(e.toString()));
    }
  }
}
