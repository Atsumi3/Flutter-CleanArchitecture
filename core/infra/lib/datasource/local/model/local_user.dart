import 'package:json_annotation/json_annotation.dart';

part 'local_user.g.dart';

@JsonSerializable()
class LocalUser {
  final String name;

  LocalUser({required this.name});

  factory LocalUser.fromJson(Map<String, dynamic> json) =>
      _$LocalUserFromJson(json);

  Map<String, dynamic> toJson() => _$LocalUserToJson(this);
}
