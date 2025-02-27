import 'package:dartz/dartz.dart';
import 'package:palm_task/core/errors/failure.dart';
import 'package:palm_task/core/utils/use_cases/use_case.dart';
import 'package:palm_task/features/data_list/domain/entities/data_entity.dart';
import 'package:palm_task/features/data_list/domain/repositories/data_repo.dart';

class DataListUseCase extends UseCase {
  final DataRepo dataRepo;

  DataListUseCase({required this.dataRepo});

  @override
  Future<Either<Failure, List<DataEntity>>> call(params) async {
    //Data List use case to get List of data
    final response = await dataRepo.getDataList();
    return response.fold((l) => Left(l), (r) => Right(r));
  }
}
