import 'package:flutter/material.dart';
import 'package:test_hotel/booking/models/booking_dto.dart';
import 'package:test_hotel/core/view/tag_container.dart';
import 'package:test_hotel/core/view/title_text.dart';

class HotelCard extends StatelessWidget {
  final BookingDTO booking;

  const HotelCard({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: ColoredContainer(
                text: '${booking.horating} ${booking.ratingName}',
                textColor: const Color(0xFFFFA800),
                backColor: const Color(0x33FFC700),
                iconData: Icons.star,
              ),
            ),
            TitleText(text: booking.hotelName),
            const SizedBox(height: 5),
            Text(
              booking.hotelAdress,
              style: const TextStyle(
                color: Color(0xFF0D72FF),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
