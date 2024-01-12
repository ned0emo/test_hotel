part of 'hotel_bloc.dart';

@immutable
abstract class HotelState {}

class HotelLoading extends HotelState {}

class HotelLoaded extends HotelState {
  final HotelDTO hotel;

  HotelLoaded({required this.hotel});
}

class HotelError extends HotelState {
  final String message;

  HotelError({required this.message});
}
