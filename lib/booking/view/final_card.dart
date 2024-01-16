import 'package:flutter/material.dart';
import 'package:test_hotel/booking/bloc/booking_bloc.dart';

class FinalCard extends StatelessWidget {
  final BookingLoaded state;

  const FinalCard({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Тур',
                    style: TextStyle(fontSize: 16, color: Color(0xFF828796)),
                  ),
                ),
                Text(
                  state.booking.formattedTourPrice,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Топливный сбор',
                    style: TextStyle(fontSize: 16, color: Color(0xFF828796)),
                  ),
                ),
                Text(
                  state.booking.formattedFuelCharge,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Сервисный сбор',
                    style: TextStyle(fontSize: 16, color: Color(0xFF828796)),
                  ),
                ),
                Text(
                  state.booking.formattedServiceCharge,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'К оплате',
                    style: TextStyle(fontSize: 16, color: Color(0xFF828796)),
                  ),
                ),
                Text(
                  state.booking.formattedFullPrice,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF0D72FF),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
