import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_hotel/core/view/image_carousel.dart';
import 'package:test_hotel/core/view/tag_container.dart';
import 'package:test_hotel/room/bloc/room_bloc.dart';
import 'package:test_hotel/room/models/room_dto.dart';
import 'package:test_hotel/room/room_repository.dart';

class RoomPage extends StatelessWidget {
  static const String routeName = '/room';

  static Route route(String hotelName) {
    return MaterialPageRoute(
        builder: (_) => RoomPage(hotelName: hotelName),
        settings: const RouteSettings(name: routeName));
  }

  final String hotelName;

  const RoomPage({super.key, required this.hotelName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RoomBloc(context.read<RoomRepository>())..add(LoadRoom()),
      child: Scaffold(
        appBar: AppBar(title: Text(hotelName), centerTitle: true),
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return BlocBuilder<RoomBloc, RoomState>(
      builder: (context, state) {
        if (state is RoomLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is RoomLoaded) {
          return ListView(
            children: state.rooms.map((e) => _roomCard(e)).toList(),
          );
        }

        if (state is RoomError) {
          return Center(child: Text(state.message));
        }

        return const Center(child: Text('Неизвестная ошибка...'));
      },
    );
  }

  Widget _roomCard(RoomDTO room) {
    return Card(
      margin: const EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageCarousel(imgUrls: room.imageUrls),
            const SizedBox(height: 16),
            Text(
              room.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              runSpacing: 10,
              spacing: 10,
              children: List.generate(
                room.peculiarities.length,
                (index) => ColoredContainer(
                    text: room.peculiarities[index],
                    textColor: const Color(0xFF828796),
                    backColor: const Color(0xFFFBFBFC)),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 30,
              child: TextButton(
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  backgroundColor: const Color(0x1A0D72FF),
                  foregroundColor: const Color(0xFF0D72FF),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
                onPressed: () {},
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Подробнее о номере',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 6),
                    Icon(Icons.arrow_forward_ios_outlined, size: 16),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'от ${room.formattedPrice}',
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
                    room.formattedPricePer,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xFF828796),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 48),
                  Text('Выбрать номер', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
