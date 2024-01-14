import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_hotel/booking/bloc/booking_bloc.dart';
import 'package:test_hotel/booking/booking_repository.dart';
import 'package:test_hotel/booking/view/client_crad.dart';
import 'package:test_hotel/booking/view/hotel_card.dart';
import 'package:test_hotel/booking/view/info_tab.dart';

class BookingPage extends StatelessWidget {
  static const String routeName = '/booking';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const BookingPage(),
        settings: const RouteSettings(name: routeName));
  }

  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BookingBloc(context.read<BookingRepository>())..add(LoadBooking()),
      child: Scaffold(
        appBar: AppBar(title: const Text("Бронирование"), centerTitle: true),
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return BlocBuilder<BookingBloc, BookingState>(
      builder: (context, state) {
        if (state is BookingLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is BookingLoaded) {
          return ListView(
            children: [
              HotelCard(booking: state.booking),
              InfoTab(
                booking: state.booking,
                width: MediaQuery.of(context).size.width * 0.4,
              ),
              ClientCard(),
            ],
          );
        }

        if (state is BookingError) {
          return Center(child: Text(state.message));
        }

        return const Center(child: Text('Неизвестная ошибка...'));
      },
    );
  }


}
