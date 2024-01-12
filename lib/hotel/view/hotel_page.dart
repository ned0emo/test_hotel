import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_hotel/hotel/bloc/hotel_bloc.dart';
import 'package:test_hotel/hotel/hotel_repository.dart';

class HotelPage extends StatefulWidget {
  const HotelPage({super.key});

  @override
  State<StatefulWidget> createState() => HotelPageState();
}

class HotelPageState extends State<HotelPage> {
  late PageController _pageController;
  int _activePage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1, initialPage: 0);
  }

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
          return ListView(
            children: [
              _mainCard(state),
              const SizedBox(height: 8),
              _aboutCard(state),
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

  Widget _mainCard(HotelLoaded state) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 0),
      elevation: 0,
      color: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                SizedBox(
                  height: 250.0,
                  child: ClipPath(
                    clipper: const ShapeBorderClipper(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    child: PageView.builder(
                      itemCount: state.hotel.imageUrls.length,
                      pageSnapping: true,
                      controller: _pageController,
                      onPageChanged: (value) {
                        setState(() {
                          _activePage = value;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Image.network(
                          fit: BoxFit.cover,
                          state.hotel.imageUrls[index],
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(child: Text('Ошибка загрузки'));
                          },
                        );
                      },
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List<Widget>.generate(
                          state.hotel.imageUrls.length,
                          (index) {
                            return Container(
                              margin: const EdgeInsets.all(3),
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                  color: _activePage == index
                                      ? const Color(0xFF000000)
                                      : Color(
                                          _color((index - _activePage).abs())),
                                  shape: BoxShape.circle),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  decoration: const BoxDecoration(
                    color: Color(0x33FFC700),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.star, color: Color(0xFFFFA800)),
                      Text(
                        '${state.hotel.rating} ${state.hotel.ratingName}',
                        style: const TextStyle(
                          color: Color(0xFFFFA800),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              state.hotel.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
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
                        text: 'от ${state.hotel.formattedPrice} ₽',
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

  Widget _aboutCard(HotelLoaded state) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 0),
      elevation: 0,
      color: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: SizedBox(
        height: 30,
      ),
    );
  }

  int _color(int diff) {
    if (diff == 1) return 0xFFBBBBBB;

    final step = 4473924 ~/ diff;
    return 0xFFBBBBBB + step;
  }
}
