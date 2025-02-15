import 'package:json_annotation/json_annotation.dart';
import 'package:rountiner/core/model/base_model.dart';
import 'package:rountiner/core/model/i_base_model.dart';
import 'package:rountiner/features/auth/data/models/goal_model.dart';
import 'package:rountiner/features/auth/domain/entities/user_entity.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends BaseModel implements IBaseModel<UserEntity> {
  final String name;
  final String email;

  @JsonKey(name: 'goals', toJson: _goalsToJson)
  final List<GoalModel> goals;

  @JsonKey(name: 'photo_url')
  final String photoUrl;

  const UserModel({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required this.name,
    required this.email,
    required this.photoUrl,
    required this.goals,
  });

  static List<Map<String, dynamic>> _goalsToJson(List<GoalModel> goals) {
    return goals.map((goal) => goal.toJson()).toList();
  }

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  UserModel fromEntity(UserEntity entity) {
    throw UnimplementedError();
  }

  @override
  UserEntity toEntity() {
    throw UnimplementedError();
  }

}
