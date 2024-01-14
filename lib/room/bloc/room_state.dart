part of 'room_bloc.dart';

@immutable
abstract class RoomState {}

class RoomLoading extends RoomState {}

class RoomLoaded extends RoomState {
  final List<RoomDTO> rooms;

  RoomLoaded({required this.rooms});
}

class RoomError extends RoomState {
  final String message;

  RoomError({required this.message});
}
