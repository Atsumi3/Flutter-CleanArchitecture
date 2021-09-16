import 'package:domain/repository/user_repository.dart';
import 'package:domain/usecase/user/logout.dart';

class LogoutInteractor implements LogoutUseCase {
  final UserRepository userRepository;

  LogoutInteractor({required this.userRepository});

  @override
  Future<void> execute() => userRepository.logout();
}
