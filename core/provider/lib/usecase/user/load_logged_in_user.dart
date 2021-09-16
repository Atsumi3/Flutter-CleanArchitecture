import 'package:domain/usecase/user/load_logged_in_user.dart';
import 'package:infra/interactor/user/load_logged_in_user.dart';
import 'package:infra/repository_provider/user_repository_provider.dart';
import 'package:riverpod/riverpod.dart';

final loadLoggedInUserUseCaseProvider = Provider<LoadLoggedInUserUseCase>(
  (ref) => LoadLoggedInUserInteractor(
    userRepository: ref.read(userRepositoryProvider),
  ),
);
