import 'package:json_annotation/json_annotation.dart';

part 'about_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AboutDTO {
  final String description;
  final List<String> peculiarities;

  AboutDTO({required this.description, required this.peculiarities});

  factory AboutDTO.fromJson(Map<String, dynamic> json) =>
      _$AboutDTOFromJson(json);

  Map<String, dynamic> toJson() => _$AboutDTOToJson(this);
}
