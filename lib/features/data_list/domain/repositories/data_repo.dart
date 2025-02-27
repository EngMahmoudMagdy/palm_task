import 'package:dartz/dartz.dart';
import 'package:palm_task/core/errors/failure.dart';
import 'package:palm_task/features/data_list/domain/entities/data_entity.dart';

abstract class DataRepo {
  Future<Either<Failure, List<DataEntity>>> getDataList();
}
