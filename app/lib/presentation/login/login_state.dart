import 'package:domain/entity/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState({User? currentUser}) = _LoginState;

  factory LoginState.init() => _LoginState();
}
