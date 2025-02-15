import 'package:rountiner/core/entity/base_entity.dart';
import 'package:rountiner/features/auth/domain/entities/habit_entity.dart';

class GoalEntity extends BaseEntity {
  final GoalEntityType type;
  final List<HabitEntity> habits;

  const GoalEntity({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required this.type,
    required this.habits,
  });

  @override
  List<Object> get props => [id, createdAt, updatedAt, type, habits];
}

enum GoalEntityType { daily, weekly, monthly, yearly, other }
