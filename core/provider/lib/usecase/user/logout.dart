import 'package:domain/usecase/user/logout.dart';
import 'package:infra/interactor/user/logout.dart';
import 'package:infra/repository_provider/user_repository_provider.dart';
import 'package:riverpod/riverpod.dart';

final logoutUseCaseProvider = Provider<LogoutUseCase>(
  (ref) => LogoutInteractor(
    userRepository: ref.read(userRepositoryProvider),
  ),
);
