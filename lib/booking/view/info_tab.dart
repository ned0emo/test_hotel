import 'package:flutter/material.dart';
import 'package:test_hotel/booking/models/booking_dto.dart';

class InfoTab extends StatelessWidget {
  final BookingDTO booking;
  final double width;

  const InfoTab({super.key, required this.booking, required this.width});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _infoRow('Вылет из', booking.departure),
            _infoRow('Страна, город', booking.arrivalCountry),
            _infoRow('Даты', booking.dates),
            _infoRow('Кол-во ночей', booking.nights),
            _infoRow('Отель', booking.hotelName),
            _infoRow('Номер', booking.room),
            _infoRow('Питание', booking.nutrition),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String rowName, String rowValue) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          SizedBox(
            width: width,
            child: Text(
              rowName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF828796),
              ),
            ),
          ),
          Expanded(
            child: Text(
              rowValue,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
