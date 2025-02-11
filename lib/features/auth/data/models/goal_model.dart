import 'package:json_annotation/json_annotation.dart';
import 'package:rountiner/core/model/base_model.dart';
import 'package:rountiner/core/model/i_base_model.dart';
import 'package:rountiner/features/auth/data/models/habit_model.dart';
import 'package:rountiner/features/auth/domain/entities/goal_entity.dart';

part 'goal_model.g.dart';

@JsonSerializable()
class GoalModel extends BaseModel implements IBaseModel<GoalEntity> {
  final String type;

  @JsonKey(name: 'habits', toJson: _habitsToJson)
  final List<HabitModel> habits;

  

  const GoalModel({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required this.type,
    required this.habits,
  });
  
  
  static List<Map<String, dynamic>> _habitsToJson(List<HabitModel> habits) {
    return habits.map((habit) => habit.toJson()).toList();
  }
  
  factory GoalModel.fromJson(Map<String, dynamic> json) =>
      _$GoalModelFromJson(json);

  Map<String, dynamic> toJson() => _$GoalModelToJson(this);

  @override
  GoalModel fromEntity(GoalEntity entity) {
    // TODO: implement fromEntity
    throw UnimplementedError();
  }

  @override
  GoalEntity toEntity() {
    // TODO: implement toEntity
    throw UnimplementedError();
  }
}
