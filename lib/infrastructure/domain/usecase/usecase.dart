import 'package:dartz/dartz.dart';

import '../error/failure.dart';

abstract class Usecase<Output, Input> {
  Future<Either<Failure, Output>> call(Input params);
}

class NoParams {
  NoParams();
}
