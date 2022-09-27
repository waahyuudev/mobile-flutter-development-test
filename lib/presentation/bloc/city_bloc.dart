import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_development_test/domain/usecases/get_city_list.dart';
import 'package:mobile_development_test/presentation/bloc/city_event.dart';
import 'package:mobile_development_test/presentation/bloc/city_state.dart';
import 'package:rxdart/rxdart.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  final GetCityList _getCityList;

  CityBloc(this._getCityList) : super(CityEmpty()) {
    on<OnCityFind>((event, emit) async {
      emit(CityLoading());

      final result = await _getCityList.execute();
      result.fold(
              (l) => emit(CityError(l.message)), (r) {
        emit(CityHasData(r));
      });
    }, transformer: debounce(const Duration(milliseconds: 500)));
  }

  EventTransformer<T> debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}