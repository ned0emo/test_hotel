import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_hotel/core/view/title_text.dart';
import 'package:test_hotel/hotel/bloc/hotel_bloc.dart';
import 'package:test_hotel/core/view/tag_container.dart';

class AboutCard extends StatelessWidget {
  final HotelLoaded state;

  const AboutCard({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 0),
      elevation: 0,
      color: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleText(text: 'Об отеле'),
            const SizedBox(height: 16),
            Wrap(
              runSpacing: 10,
              spacing: 10,
              children: List.generate(
                state.hotel.aboutTheHotel.peculiarities.length,
                (index) => ColoredContainer(
                    text: state.hotel.aboutTheHotel.peculiarities[index],
                    textColor: const Color(0xFF828796),
                    backColor: const Color(0xFFFBFBFC)),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              state.hotel.aboutTheHotel.description,
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                  color: Color(0xE6000000)),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: const BoxDecoration(
                color: Color(0xFFFBFBFC),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Column(
                children: [
                  _detailedTile(
                    'assets/emoji_happy.svg',
                    'Удобства',
                    'Самое необходимое',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Container(
                      height: 1,
                      decoration: const BoxDecoration(color: Color(0x26828796)),
                    ),
                  ),
                  _detailedTile(
                    'assets/tick_square.svg',
                    'Что включено',
                    'Самое необходимое',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Container(
                      height: 1,
                      decoration: const BoxDecoration(color: Color(0x26828796)),
                    ),
                  ),
                  _detailedTile(
                    'assets/close_square.svg',
                    'Что не включено',
                    'Самое необходимое',
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailedTile(String asset, String title, String subTitle) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: SvgPicture.asset(asset),
      title: Text(title),
      subtitle: Text(subTitle),
      titleTextStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        color: Color(0xFF2C3035),
      ),
      subtitleTextStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        color: Color(0xFF828796),
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
