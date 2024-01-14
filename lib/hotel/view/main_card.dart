import 'package:flutter/material.dart';
import 'package:test_hotel/core/view/image_carousel.dart';
import 'package:test_hotel/core/view/tag_container.dart';
import 'package:test_hotel/core/view/title_text.dart';
import 'package:test_hotel/hotel/bloc/hotel_bloc.dart';

class MainCard extends StatelessWidget {
  const MainCard({super.key, required this.state});

  final HotelLoaded state;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageCarousel(imgUrls: state.hotel.imageUrls),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: ColoredContainer(
                text: '${state.hotel.rating} ${state.hotel.ratingName}',
                textColor: const Color(0xFFFFA800),
                backColor: const Color(0x33FFC700),
                iconData: Icons.star,
              ),
            ),
            TitleText(text: state.hotel.name),
            const SizedBox(height: 5),
            Text(
              state.hotel.adress,
              style: const TextStyle(
                color: Color(0xFF0D72FF),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'от ${state.hotel.formattedPrice}',
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    state.hotel.formattedPriceForIt,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xFF828796),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
