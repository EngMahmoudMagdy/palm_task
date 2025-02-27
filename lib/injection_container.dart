import 'package:appwrite/appwrite.dart';
import 'package:get_it/get_it.dart';
import 'package:palm_task/core/network/app_write_client.dart';
import 'package:palm_task/core/utils/app_constants.dart';
import 'package:palm_task/features/data_list/data/data_sources/remote_data_source.dart';
import 'package:palm_task/features/data_list/data/repositories/data_repo_impl.dart';
import 'package:palm_task/features/data_list/domain/use_cases/data_list_use_case.dart';
import 'package:palm_task/features/data_list/presentation/bloc/home_cubit.dart';

import 'features/data_list/domain/repositories/data_repo.dart';

final di = GetIt.instance;

Future<void> init() async {

  //Injecting AppWrite client as a Singleton
  di.registerLazySingleton(
    () => AppWriteClient(
      client: di(),
      projectId: AppConstants.PROJECT_ID,
    ),
  );

  //Injecting HomeCubit and its dependencies as a Singleton
  di.registerLazySingleton(() => HomeCubit(di()));
  di.registerLazySingleton(() => DataListUseCase(dataRepo: di()));
  di.registerLazySingleton<DataRepo>(
    () => DataRepoImpl(remoteDataSource: di()),
  );
  di.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(di()));
  di.registerLazySingleton(() => Client(endPoint: AppConstants.END_POINT_URL));
}
