import 'package:json_annotation/json_annotation.dart';

part 'remote_user.g.dart';

@JsonSerializable()
class RemoteUser {
  final String name;

  RemoteUser({required this.name});

  factory RemoteUser.fromJson(Map<String, dynamic> json) =>
      _$RemoteUserFromJson(json);
}
