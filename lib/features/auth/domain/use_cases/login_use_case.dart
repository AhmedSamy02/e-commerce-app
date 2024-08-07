import 'package:dartz/dartz.dart';
import 'package:simple_ecommerce/core/errors/failure.dart';
import 'package:simple_ecommerce/core/use_cases/use_case_with_params.dart';
import 'package:simple_ecommerce/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase extends UseCaseWithTwoParams<void,String, String> {
  final AuthRepository repository;

  LoginUseCase({required this.repository});

  @override
  Future<Either<Failure, void>> call(email, password) {
    return repository.login(email, password);
  }
}
