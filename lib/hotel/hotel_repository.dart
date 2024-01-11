import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:test_hotel/core/custom_exception.dart';
import 'package:test_hotel/core/host_repository.dart';
import 'package:test_hotel/hotel/models/hotel_dto.dart';

class HotelRepository {
  final HostRepository _host;

  HotelRepository(this._host);

  Future<HotelDTO> loadHotel() async {
    final ConnectivityResult internet =
        await (Connectivity().checkConnectivity());
    if (internet == ConnectivityResult.none) {
      throw CustomException('Нет подключения к сети');
    }

    const path = "https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473";
    final options = Options(headers: {'Content-Type': 'application/json'});

    final response = await _host.dio.get(path, options: options);
    return HotelDTO.fromJson(response.data);
  }
}
