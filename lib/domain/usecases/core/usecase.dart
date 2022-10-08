// import 'failures.dart';
// import 'package:dartz/dartz.dart';

abstract class UseCase<InputData, OutputData> {
  // Future<Either<Failure, OutputData>> handle(InputData inputData);
  OutputData handle(InputData inputData);
}
