import 'package:domain/usecase/user/load_logged_in_user.dart';
import 'package:domain/usecase/user/login.dart';
import 'package:domain/usecase/user/logout.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/usecase/user/load_logged_in_user.dart';
import 'package:provider/usecase/user/login.dart';
import 'package:provider/usecase/user/logout.dart';

import 'login_state.dart';

final loginControllerProvider =
    StateNotifierProvider<LoginController, LoginState>(
  (ref) => LoginController(ref),
);

class LoginController extends StateNotifier<LoginState> {
  LoginController(ProviderRefBase ref)
      : _loginUseCase = ref.read(loginUseCaseProvider),
        _logoutUseCase = ref.read(logoutUseCaseProvider),
        _loadLoggedInUserUseCase = ref.read(loadLoggedInUserUseCaseProvider),
        super(LoginState.init());
  final LoginUseCase _loginUseCase;
  final LogoutUseCase _logoutUseCase;
  final LoadLoggedInUserUseCase _loadLoggedInUserUseCase;

  Future<void> _updateLoginStatus() async {
    state = state.copyWith.call(
      currentUser: await _loadLoggedInUserUseCase.execute(),
    );
  }
}

/// Event
extension Event on LoginController {
  Future<void> load() async {
    await _updateLoginStatus();
  }

  Future<void> onLoginTap() async {
    await _login();
  }

  Future<void> onLogoutTap() async {
    await _logout();
  }
}

/// Logic
extension UseCaseLogic on LoginController {
  Future<void> _login() async {
    _loginUseCase.execute().then((_) async {
      await _updateLoginStatus();
    }, onError: (error) {
      /// いい感じのエラー処理
    });
  }

  Future<void> _logout() async {
    _logoutUseCase.execute().then((_) async {
      await _updateLoginStatus();
    }, onError: (error) {
      /// いい感じのエラー処理
    });
  }
}
