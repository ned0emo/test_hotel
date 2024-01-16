import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:test_hotel/booking/booking_repository.dart';
import 'package:test_hotel/booking/models/booking_dto.dart';
import 'package:test_hotel/booking/view/tourist_card.dart';
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
        emit(BookingLoaded(booking: booking, tourists: const []));
      } on DioException {
        emit(BookingError(message: 'Ошибка подключения'));
      } on CustomException catch (e) {
        emit(BookingError(message: e.message));
      } catch (e) {
        emit(BookingError(message: e.runtimeType.toString()));
      }
    });

    on<AddTourist>((event, emit) {
      final currentState = state;
      if (currentState is BookingLoaded) {
        final tourists = currentState.tourists.skip(0);

        if (tourists.first.isValid) {
          emit(
            currentState.copyWith(
              tourists: tourists.toList()..add(TouristCard()),
            ),
          );
        } else {
          emit(
            currentState.copyWith(
              checkFields: true,
            ),
          );
        }
      }
    });
  }
}
