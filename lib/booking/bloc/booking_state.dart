part of 'booking_bloc.dart';

@immutable
abstract class BookingState {}

class BookingLoading extends BookingState {}

class BookingLoaded extends BookingState {
  final BookingDTO booking;

  BookingLoaded({required this.booking});
}

class BookingError extends BookingState {
  final String message;

  BookingError({required this.message});
}
