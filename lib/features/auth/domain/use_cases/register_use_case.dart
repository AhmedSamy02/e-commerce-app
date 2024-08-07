import 'package:dartz/dartz.dart';
import 'package:simple_ecommerce/core/errors/failure.dart';
import 'package:simple_ecommerce/core/use_cases/use_case_with_params.dart';
import 'package:simple_ecommerce/features/auth/domain/repositories/auth_repository.dart';

class RegisterUseCase
    extends UseCaseWithThreeParams<void, String, String, String> {
  final AuthRepository repository;

  RegisterUseCase({required this.repository});
  @override
  Future<Either<Failure, void>> call(
      String username, String email, String password) {
    return repository.register(username, email, password);
  }
}
