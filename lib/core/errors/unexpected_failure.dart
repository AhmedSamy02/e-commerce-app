import 'package:simple_ecommerce/core/errors/failure.dart';

class UnexpectedFailure implements Failure {
  @override
  final String message;

  UnexpectedFailure({required this.message});
}
