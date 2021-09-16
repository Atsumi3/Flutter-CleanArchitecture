import 'package:domain/entity/user.dart';
import 'package:domain/repository/user_repository.dart';
import 'package:domain/usecase/user/load_logged_in_user.dart';

class LoadLoggedInUserInteractor implements LoadLoggedInUserUseCase {
  final UserRepository userRepository;

  LoadLoggedInUserInteractor({required this.userRepository});

  @override
  Future<User?> execute() => userRepository.loadLoggedInUser();
}
