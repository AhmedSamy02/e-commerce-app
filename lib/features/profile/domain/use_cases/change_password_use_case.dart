import 'package:dartz/dartz.dart';
import 'package:simple_ecommerce/core/errors/failure.dart';
import 'package:simple_ecommerce/core/use_cases/use_case_with_params.dart';
import 'package:simple_ecommerce/features/profile/domain/repositories/profile_repo.dart';

class ChangePasswordUseCase extends UseCaseWithTwoParams<void, String, String> {
  final ProfileRepository repository;

  ChangePasswordUseCase({required this.repository});
  @override
  Future<Either<Failure, void>> call(String oldPassword, String newPassword) {
    return repository.changePassword(oldPassword, newPassword);
  }
}
