import 'package:domain/usecase/user/login.dart';
import 'package:infra/interactor/user/login.dart';
import 'package:infra/repository_provider/user_repository_provider.dart';
import 'package:riverpod/riverpod.dart';

final loginUseCaseProvider = Provider<LoginUseCase>(
  (ref) => LoginInteractor(
    userRepository: ref.read(userRepositoryProvider),
  ),
);
