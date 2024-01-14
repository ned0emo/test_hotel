import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:test_hotel/core/custom_exception.dart';
import 'package:test_hotel/core/host_repository.dart';
import 'package:test_hotel/room/models/room_dto.dart';

class RoomRepository {
  final HostRepository _host;

  RoomRepository(this._host);

  Future<List<RoomDTO>> loadRoom() async {
    final ConnectivityResult internet =
        await (Connectivity().checkConnectivity());
    if (internet == ConnectivityResult.none) {
      throw CustomException('Нет подключения к сети');
    }

    const path = "https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195";
    final options = Options(headers: {'Content-Type': 'application/json'});

    final list = <RoomDTO>[];

    final response = await _host.dio.get(path, options: options);
    final jsonArr = List<Map<String, dynamic>>.from(response.data['rooms']);
    for (Map<String, dynamic> json in jsonArr) {
      list.add(RoomDTO.fromJson(json));
    }

    return list;
  }
}
