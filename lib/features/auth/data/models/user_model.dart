import 'package:json_annotation/json_annotation.dart';
import 'package:rountiner/core/entity/base_entity.dart';
import 'package:rountiner/core/model/base_model.dart';
import 'package:rountiner/core/model/i_base_model.dart';
import 'package:rountiner/features/auth/domain/entities/user_entity.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends BaseModel implements IBaseModel<UserEntity> {
  final String name;
  final String email;
  final List<Map<String, dynamic>> goals;

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

  // @override
  // UserEntity toEntity() {
  //   return UserEntity(
  //     id: id,
  //     createdAt: createdAt,
  //     updatedAt: updatedAt,
  //     name: name,
  //     email: email,
  //     photoUrl: photoUrl,
  //     goals: goals.map((goal) => goal).toList(),
  //   );
  // }

}
