import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'room_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RoomDTO {
  final int id;
  final String name;
  final int price;
  final String pricePer;
  final List<String> peculiarities;
  final List<String> imageUrls;

  RoomDTO({
    required this.id,
    required this.name,
    required this.price,
    required this.pricePer,
    required this.peculiarities,
    required this.imageUrls,
  });

  factory RoomDTO.fromJson(Map<String, dynamic> json) =>
      _$RoomDTOFromJson(json);

  Map<String, dynamic> toJson() => _$RoomDTOToJson(this);

  String get formattedPrice {
    if (price < 1000) return price.toString();

    return '${NumberFormat("#,###").format(price).replaceAll(',', ' ')} ₽';
  }

  String get formattedPricePer {
    return pricePer.toLowerCase();
  }
}
