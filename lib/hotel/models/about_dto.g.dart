// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AboutDTO _$AboutDTOFromJson(Map<String, dynamic> json) => AboutDTO(
      description: json['description'] as String,
      peculiarities: (json['peculiarities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$AboutDTOToJson(AboutDTO instance) => <String, dynamic>{
      'description': instance.description,
      'peculiarities': instance.peculiarities,
    };
