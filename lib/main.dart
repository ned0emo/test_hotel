import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_hotel/booking/booking_repository.dart';
import 'package:test_hotel/core/app_router.dart';
import 'package:test_hotel/core/host_repository.dart';
import 'package:test_hotel/hotel/hotel_repository.dart';
import 'package:test_hotel/hotel/view/hotel_page.dart';
import 'package:test_hotel/room/room_repository.dart';
import 'package:test_hotel/themes/primary.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => HostRepository(),
        ),
        RepositoryProvider(
          create: (context) => HotelRepository(context.read<HostRepository>()),
        ),
        RepositoryProvider(
          create: (context) => RoomRepository(context.read<HostRepository>()),
        ),
        RepositoryProvider(
          create: (context) =>
              BookingRepository(context.read<HostRepository>()),
        )
      ],
      child: MaterialApp(
        initialRoute: HotelPage.routeName,
        onGenerateRoute: AppRouter.onGenerateRoute,
        title: 'Отели',
        theme: PrimaryTheme().data,
      ),
    );
  }
}
