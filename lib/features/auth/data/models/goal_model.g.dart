// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoalModel _$GoalModelFromJson(Map<String, dynamic> json) => GoalModel(
      id: json['id'] as String,
      createdAt:
          BaseModel.dateTimeFromJson((json['created_at'] as num).toInt()),
      updatedAt:
          BaseModel.dateTimeFromJson((json['updated_at'] as num).toInt()),
      type: json['type'] as String,
      habits: (json['habits'] as List<dynamic>)
          .map((e) => HabitModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GoalModelToJson(GoalModel instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': BaseModel.dateTimeToJson(instance.createdAt),
      'updated_at': BaseModel.dateTimeToJson(instance.updatedAt),
      'type': instance.type,
      'habits': GoalModel._habitsToJson(instance.habits),
    };
