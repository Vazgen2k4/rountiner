import 'package:json_annotation/json_annotation.dart';

abstract class BaseModel {
  final String id;

  @JsonKey(
    name: 'created_at',
    fromJson: dateTimeFromJson,
    toJson: dateTimeToJson,
  )
  final DateTime createdAt;
 
  @JsonKey(
    name: 'updated_at',
    fromJson: dateTimeFromJson,
    toJson: dateTimeToJson,
  )
  final DateTime updatedAt;

  const BaseModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  /// 🟢 Конвертация JSON → DateTime
  static DateTime dateTimeFromJson(int timestamp) =>
      DateTime.fromMillisecondsSinceEpoch(timestamp);

  /// 🔵 Конвертация DateTime → JSON
  static int dateTimeToJson(DateTime date) => date.millisecondsSinceEpoch;
}
