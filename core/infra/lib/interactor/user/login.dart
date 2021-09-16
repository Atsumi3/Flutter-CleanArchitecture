import 'package:domain/repository/user_repository.dart';
import 'package:domain/usecase/user/login.dart';

class LoginInteractor implements LoginUseCase {
  final UserRepository userRepository;

  LoginInteractor({required this.userRepository});

  @override
  Future<void> execute() => userRepository.login();
}
