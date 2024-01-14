import 'package:flutter/material.dart';
import 'package:test_hotel/hotel/view/hotel_page.dart';
import 'package:test_hotel/room/view/room_page.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HotelPage.routeName:
        return HotelPage.route();
      case RoomPage.routeName:
        return RoomPage.route(settings.arguments as String);
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        builder: (_) =>
            Scaffold(appBar: AppBar(title: const Text('Страница не найдена'))),
        settings: const RouteSettings(name: '/not-found'));
  }
}
