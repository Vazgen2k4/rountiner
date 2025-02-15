// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HabitModel _$HabitModelFromJson(Map<String, dynamic> json) => HabitModel(
      id: json['id'] as String,
      createdAt:
          BaseModel.dateTimeFromJson((json['created_at'] as num).toInt()),
      updatedAt:
          BaseModel.dateTimeFromJson((json['updated_at'] as num).toInt()),
      name: json['name'] as String,
      description: json['description'] as String,
      status: $enumDecode(_$HabitEntityStatusEnumMap, json['status']),
      priority: $enumDecode(_$HabitEntityPriorityEnumMap, json['priority']),
      icon: $enumDecode(_$HabitEntityIconEnumMap, json['icon']),
      color: HabitModel._colorFromJson(json['color'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HabitModelToJson(HabitModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': BaseModel.dateTimeToJson(instance.createdAt),
      'updated_at': BaseModel.dateTimeToJson(instance.updatedAt),
      'name': instance.name,
      'description': instance.description,
      'status': _$HabitEntityStatusEnumMap[instance.status]!,
      'priority': _$HabitEntityPriorityEnumMap[instance.priority]!,
      'icon': _$HabitEntityIconEnumMap[instance.icon]!,
      'color': HabitModel._colorToJson(instance.color),
    };

const _$HabitEntityStatusEnumMap = {
  HabitEntityStatus.active: 'active',
  HabitEntityStatus.paused: 'paused',
  HabitEntityStatus.completed: 'completed',
  HabitEntityStatus.failed: 'failed',
};

const _$HabitEntityPriorityEnumMap = {
  HabitEntityPriority.low: 'low',
  HabitEntityPriority.medium: 'medium',
  HabitEntityPriority.high: 'high',
};

const _$HabitEntityIconEnumMap = {
  HabitEntityIcon.sport: 'sport',
  HabitEntityIcon.health: 'health',
  HabitEntityIcon.work: 'work',
  HabitEntityIcon.study: 'study',
  HabitEntityIcon.hobby: 'hobby',
  HabitEntityIcon.other: 'other',
};
