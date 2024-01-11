// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelDTO _$HotelDTOFromJson(Map<String, dynamic> json) => HotelDTO(
      id: json['id'] as int,
      name: json['name'] as String,
      adress: json['adress'] as String,
      minimalPrice: json['minimalPrice'] as int,
      priceForIt: json['priceForIt'] as String,
      rating: (json['rating'] as num).toDouble(),
      ratingName: json['ratingName'] as String,
      imageUrls:
          (json['imageUrls'] as List<dynamic>).map((e) => e as String).toList(),
      aboutTheHotel:
          AboutDTO.fromJson(json['aboutTheHotel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HotelDTOToJson(HotelDTO instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'adress': instance.adress,
      'minimalPrice': instance.minimalPrice,
      'priceForIt': instance.priceForIt,
      'rating': instance.rating,
      'ratingName': instance.ratingName,
      'imageUrls': instance.imageUrls,
      'aboutTheHotel': instance.aboutTheHotel,
    };
