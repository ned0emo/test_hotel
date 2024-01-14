import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_hotel/hotel/bloc/hotel_bloc.dart';
import 'package:test_hotel/hotel/hotel_repository.dart';
import 'package:test_hotel/hotel/view/about_card.dart';
import 'package:test_hotel/hotel/view/main_card.dart';
import 'package:test_hotel/room/view/room_page.dart';

class HotelPage extends StatefulWidget {
  static const String routeName = '/hotel';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const HotelPage(),
        settings: const RouteSettings(name: routeName));
  }

  const HotelPage({super.key});

  @override
  State<StatefulWidget> createState() => HotelPageState();
}

class HotelPageState extends State<HotelPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HotelBloc(context.read<HotelRepository>())..add(LoadHotel()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("Отель"),
          centerTitle: true,
        ),
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return BlocBuilder<HotelBloc, HotelState>(
      builder: (context, state) {
        if (state is HotelLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is HotelLoaded) {
          return Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    MainCard(state: state),
                    const SizedBox(height: 8),
                    AboutCard(state: state),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.white),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                child: FilledButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      RoomPage.routeName,
                      arguments: state.hotel.name,
                    );
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 48),
                      Text('К выбору номера', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ),
            ],
          );
        }

        if (state is HotelError) {
          return Center(child: Text(state.message));
        }

        return const Center(child: Text('Неизвестная ошибка...'));
      },
    );
  }
}
