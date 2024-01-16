import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_hotel/booking/bloc/booking_bloc.dart';
import 'package:test_hotel/core/view/title_text.dart';

class AddTouristCard extends StatelessWidget{
  const AddTouristCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 10),
      child: Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            const TitleText(text: 'Добавить туриста'),
            const Expanded(child: SizedBox()),
            IconButton(
              style: IconButton.styleFrom(
                backgroundColor: const Color(0xFF0D72FF),
                foregroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
              ),
              onPressed: () {
                context.read<BookingBloc>().add(AddTourist());
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}