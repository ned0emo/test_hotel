import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_hotel/booking/bloc/booking_bloc.dart';
import 'package:test_hotel/booking/booking_repository.dart';
import 'package:test_hotel/booking/view/booking_data_card.dart';
import 'package:test_hotel/booking/view/client_card.dart';
import 'package:test_hotel/booking/view/final_card.dart';
import 'package:test_hotel/booking/view/hotel_card.dart';
import 'package:test_hotel/booking/view/tourist_card.dart';
import 'package:test_hotel/core/view/title_text.dart';

class BookingPage extends StatefulWidget {
  static const String routeName = '/booking';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const BookingPage(),
        settings: const RouteSettings(name: routeName));
  }

  const BookingPage({super.key});

  @override
  State<StatefulWidget> createState() => BookingPageState();
}

class BookingPageState extends State<BookingPage>
    with AutomaticKeepAliveClientMixin {
  List<TouristCard> tourists = [TouristCard()];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) =>
          BookingBloc(context.read<BookingRepository>())..add(LoadBooking()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Бронирование"),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
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
          return Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    HotelCard(booking: state.booking),
                    BookingDataCard(
                      booking: state.booking,
                      width: MediaQuery.of(context).size.width * 0.4,
                    ),
                    const ClientCard(),
                    ...tourists.map((e) => e),
                    Card(
                      margin: const EdgeInsets.only(top: 10),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        child: Row(
                          children: [
                            const TitleText(text: 'Добавить туриста'),
                            const Expanded(child: SizedBox()),
                            IconButton(
                              style: IconButton.styleFrom(
                                backgroundColor: const Color(0xFF0D72FF),
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                ),
                              ),
                              onPressed: () {
                                if (!tourists.first.isValid) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Не все поля заполнены'),
                                    ),
                                  );
                                  setState(() {
                                    tourists.first =
                                        tourists.first.copyWith(true);
                                  });
                                  return;
                                }

                                setState(() {
                                  tourists.add(TouristCard());
                                });
                              },
                              icon: SvgPicture.asset('assets/plus.svg'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    FinalCard(state: state),
                    const SizedBox(height: 10),
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
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 48),
                      Text(
                        'Оплатить ${state.booking.formattedFullPrice}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
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

  @override
  bool get wantKeepAlive => true;
}
