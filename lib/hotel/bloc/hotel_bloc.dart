import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_hotel/hotel/hotel_repository.dart';

part 'hotel_event.dart';

part 'hotel_state.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  final HotelRepository _repository;

  HotelBloc(this._repository) : super(HotelLoading()) {
    on<HotelEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
