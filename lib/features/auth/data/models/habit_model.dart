import 'package:flutter/services.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rountiner/core/model/base_model.dart';
import 'package:rountiner/core/model/i_base_model.dart';
import 'package:rountiner/features/auth/domain/entities/habit_entity.dart';

// part 'habit_model.g.dart';

@JsonSerializable()
class HabitModel extends BaseModel implements IBaseModel<HabitEntity> {
  final String name;
  final String description;
  final HabitEntityStatus status;
  final HabitEntityPriority priority;
  final HabitEntityIcon icon;
  
  // @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson,)
  final Color color;

  

  const HabitModel({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required this.name,
    required this.description,
    required this.status,
    required this.priority,
    required this.icon,
    required this.color,
  });

  @override
  HabitModel fromEntity(HabitEntity entity) {
    // TODO: implement fromEntity
    throw UnimplementedError();
  }

  @override
  HabitEntity toEntity() {
    // TODO: implement toEntity
    throw UnimplementedError();
  }

  // factory HabitModel.fromJson(Map<String, dynamic> json) =>
  //     _$HabitModelFromJson(json);

  // Map<String, dynamic> toJson() => _$HabitModelToJson(this);
}
