import 'package:groceries_app/data/models/response/user_info_dto.dart';
import 'package:groceries_app/domain/entities/user_info_entity.dart';

extension UserInfoMapper on UserInfoDto {
  UserInfoEntity toEntity() => UserInfoEntity(
    id: id,
    fullName: '$firstName $maidenName $lastName',
    email: email,
    image: image,
  );
}
