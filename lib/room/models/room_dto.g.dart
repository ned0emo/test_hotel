// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomDTO _$RoomDTOFromJson(Map<String, dynamic> json) => RoomDTO(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as int,
      pricePer: json['price_per'] as String,
      peculiarities: (json['peculiarities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      imageUrls: (json['image_urls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$RoomDTOToJson(RoomDTO instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'price_per': instance.pricePer,
      'peculiarities': instance.peculiarities,
      'image_urls': instance.imageUrls,
    };
