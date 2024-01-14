import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:test_hotel/booking/models/booking_dto.dart';
import 'package:test_hotel/core/custom_exception.dart';
import 'package:test_hotel/core/host_repository.dart';

class BookingRepository {
  final HostRepository _host;

  BookingRepository(this._host);

  Future<BookingDTO> loadBooking() async {
    final ConnectivityResult internet =
        await (Connectivity().checkConnectivity());
    if (internet == ConnectivityResult.none) {
      throw CustomException('Нет подключения к сети');
    }

    const path = "https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff";
    final options = Options(headers: {'Content-Type': 'application/json'});

    final response = await _host.dio.get(path, options: options);
    return BookingDTO.fromJson(response.data);
  }
}
