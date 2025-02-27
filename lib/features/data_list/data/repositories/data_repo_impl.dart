import 'package:dartz/dartz.dart';
import 'package:palm_task/core/errors/failure.dart';
import 'package:palm_task/features/data_list/data/data_sources/remote_data_source.dart';
import 'package:palm_task/features/data_list/domain/entities/data_entity.dart';
import 'package:palm_task/features/data_list/domain/repositories/data_repo.dart';

class DataRepoImpl implements DataRepo {
  final RemoteDataSource remoteDataSource;

  DataRepoImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<DataEntity>>> getDataList() async {
    try {
      //Getting list of documents data from Remote datasource
      final response = await remoteDataSource.getDataList();
      //Mapping list of DataModel to DataEntity to be used in UI components
      return Right(
        response
            .map(
              (dataModel) => DataEntity(
                title: dataModel.title,
                description: dataModel.description,
              ),
            )
            .toList(),
      );
    } on Exception catch (e) {
      return Left(ServerFailure(errorCode: 0, message: e.toString()));
    }
  }
}
