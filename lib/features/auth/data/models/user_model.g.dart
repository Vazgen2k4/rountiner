// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String,
      createdAt:
          BaseModel.dateTimeFromJson((json['created_at'] as num).toInt()),
      updatedAt:
          BaseModel.dateTimeFromJson((json['updated_at'] as num).toInt()),
      name: json['name'] as String,
      email: json['email'] as String,
      photoUrl: json['photo_url'] as String,
      goals: (json['goals'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': BaseModel.dateTimeToJson(instance.createdAt),
      'updated_at': BaseModel.dateTimeToJson(instance.updatedAt),
      'name': instance.name,
      'email': instance.email,
      'goals': instance.goals,
      'photo_url': instance.photoUrl,
    };
