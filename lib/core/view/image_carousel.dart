import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  final List<String> imgUrls;

  const ImageCarousel({super.key, required this.imgUrls});

  @override
  State<StatefulWidget> createState() => ImageCarouselState();
}

class ImageCarouselState extends State<ImageCarousel> {
  late PageController _pageController;
  int _activePage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1, initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
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
              itemCount: widget.imgUrls.length,
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
                  widget.imgUrls[index],
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
                  widget.imgUrls.length,
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
