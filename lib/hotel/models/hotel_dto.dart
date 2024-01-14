import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:test_hotel/hotel/models/about_dto.dart';

part 'hotel_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class HotelDTO {
  final int id;
  final String name;
  final String adress;
  final int minimalPrice;
  final String priceForIt;
  final int rating;
  final String ratingName;
  final List<String> imageUrls;
  final AboutDTO aboutTheHotel;

  HotelDTO({
    required this.id,
    required this.name,
    required this.adress,
    required this.minimalPrice,
    required this.priceForIt,
    required this.rating,
    required this.ratingName,
    required this.imageUrls,
    required this.aboutTheHotel,
  });

  factory HotelDTO.fromJson(Map<String, dynamic> json) =>
      _$HotelDTOFromJson(json);

  Map<String, dynamic> toJson() => _$HotelDTOToJson(this);

  String get formattedPrice {
    if (minimalPrice < 1000) return minimalPrice.toString();

    return '${NumberFormat("#,###").format(minimalPrice).replaceAll(',', ' ')} ₽';
  }

  String get formattedPriceForIt {
    return priceForIt.toLowerCase();
  }
}
