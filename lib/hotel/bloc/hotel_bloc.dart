import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:test_hotel/core/custom_exception.dart';
import 'package:test_hotel/hotel/hotel_repository.dart';
import 'package:test_hotel/hotel/models/hotel_dto.dart';

part 'hotel_event.dart';
part 'hotel_state.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  final HotelRepository _repository;

  HotelBloc(this._repository) : super(HotelLoading()) {
    on<LoadHotel>((event, emit) async {
      emit(HotelLoading());
      try {
        final hotel = await _repository.loadHotel();
        emit(HotelLoaded(hotel: hotel));
      } on DioException {
        emit(HotelError(message: 'Ошибка подключения'));
      } on CustomException catch (e) {
        emit(HotelError(message: e.message));
      } catch (e) {
        emit(HotelError(message: e.runtimeType.toString()));
      }
    });
  }
}
