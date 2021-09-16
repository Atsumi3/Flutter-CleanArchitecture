import '../../entity/user.dart';

abstract class LoadLoggedInUserUseCase {
  Future<User?> execute();
}
