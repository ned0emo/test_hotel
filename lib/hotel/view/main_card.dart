import 'package:flutter/material.dart';
import 'package:test_hotel/hotel/bloc/hotel_bloc.dart';
import 'package:test_hotel/hotel/view/tag_container.dart';

class MainCard extends StatefulWidget {
  const MainCard({super.key, required this.state});

  final HotelLoaded state;

  @override
  State<StatefulWidget> createState() => MainCardState();
}

class MainCardState extends State<MainCard> {
  late PageController _pageController;
  int _activePage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1, initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    final state = widget.state;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 0),
      elevation: 0,
      color: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
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
                                color: Color(
                                  _color((index - _activePage).abs()),
                                ),
                                shape: BoxShape.circle,
                              ),
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: TagContainer(
                    text: '${state.hotel.rating} ${state.hotel.ratingName}',
                    textColor: const Color(0xFFFFA800),
                    backColor: const Color(0x33FFC700),
                    iconData: Icons.star,
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

  int _color(int diff) {
    switch (diff) {
      case 1:
        return 0x33000000;
      case 2:
        return 0x26000000;
      case 3:
        return 0x1A000000;
      case 4:
        return 0x0D000000;
      default:
        return 0xFF000000;
    }
  }
}
