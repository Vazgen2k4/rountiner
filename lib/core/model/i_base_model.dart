import 'package:rountiner/core/entity/base_entity.dart';

abstract interface class IBaseModel<T extends BaseEntity> {
  T toEntity();
  IBaseModel<T> fromEntity(T entity);
}
