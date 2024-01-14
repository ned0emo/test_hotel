import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:test_hotel/booking/booking_repository.dart';
import 'package:test_hotel/booking/models/booking_dto.dart';
import 'package:test_hotel/core/custom_exception.dart';

part 'booking_event.dart';

part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final BookingRepository _repository;

  BookingBloc(this._repository) : super(BookingLoading()) {
    on<LoadBooking>((event, emit) async {
      emit(BookingLoading());
      try {
        final booking = await _repository.loadBooking();
        emit(BookingLoaded(booking: booking));
      } on DioException {
        emit(BookingError(message: 'Ошибка подключения'));
      } on CustomException catch (e) {
        emit(BookingError(message: e.message));
      } catch (e) {
        emit(BookingError(message: e.runtimeType.toString()));
      }
    });
  }
}
