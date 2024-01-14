import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:test_hotel/core/custom_exception.dart';
import 'package:test_hotel/room/models/room_dto.dart';
import 'package:test_hotel/room/room_repository.dart';

part 'room_event.dart';
part 'room_state.dart';

class RoomBloc extends Bloc<RoomEvent, RoomState> {
  final RoomRepository _repository;

  RoomBloc(this._repository) : super(RoomLoading()) {
    on<LoadRoom>((event, emit) async {
      emit(RoomLoading());
      try {
        final rooms = await _repository.loadRoom();
        emit(RoomLoaded(rooms: rooms));
      } on DioException {
        emit(RoomError(message: 'Ошибка подключения'));
      } on CustomException catch (e) {
        emit(RoomError(message: e.message));
      } catch (e) {
        emit(RoomError(message: e.runtimeType.toString()));
      }
    });
  }
}
