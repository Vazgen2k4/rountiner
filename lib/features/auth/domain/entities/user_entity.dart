import 'package:rountiner/core/entity/base_entity.dart';
import 'package:rountiner/features/auth/domain/entities/goal_entity.dart';

class UserEntity extends BaseEntity {
  final String name;
  final String email;
  final String photoUrl;
  final List<GoalEntity> goals;

  const UserEntity({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required this.name,
    required this.email,
    required this.photoUrl,
    required this.goals,
  });

  @override
  List<Object> get props =>
      [id, name, email, photoUrl, goals, createdAt, updatedAt];
}
