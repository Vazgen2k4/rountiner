import 'package:flutter/services.dart';
import 'package:rountiner/core/entity/base_entity.dart';

class HabitEntity extends BaseEntity {
  final String name;
  final String description;

  final HabitEntityStatus status;
  final HabitEntityPriority priority;
  final HabitEntityIcon icon;
  final Color color;

  const HabitEntity({
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
}

enum HabitEntityStatus {
  active,
  paused,
  completed,
  failed;

  static HabitEntityStatus fromString(String value) {
    switch (value) {
      case 'active':
        return HabitEntityStatus.active;
      case 'paused':
        return HabitEntityStatus.paused;
      case 'completed':
        return HabitEntityStatus.completed;
      case 'failed':
        return HabitEntityStatus.failed;
      default:
        throw PlatformException(
          code: 'HabitEntityStatus',
          message: 'Unknown value: $value',
        );
    }
  }
}

enum HabitEntityPriority { low, medium, high }

enum HabitEntityIcon { sport, health, work, study, hobby, other }
