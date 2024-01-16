part of 'booking_bloc.dart';

@immutable
abstract class BookingState {}

class BookingLoading extends BookingState {}

class BookingLoaded extends BookingState {
  final BookingDTO booking;
  final List<TouristCard> tourists;
  final bool checkFields;

  BookingLoaded({
    required this.booking,
    required this.tourists,
    this.checkFields = false,
  });

  BookingLoaded copyWith({
    BookingDTO? booking,
    List<TouristCard>? tourists,
    bool? checkFields,
  }) {
    return BookingLoaded(
      booking: booking ?? this.booking,
      tourists: tourists ?? this.tourists,
      checkFields: checkFields ?? false,
    );
  }
}

class BookingError extends BookingState {
  final String message;

  BookingError({required this.message});
}
