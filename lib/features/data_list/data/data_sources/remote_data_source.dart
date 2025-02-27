import 'package:appwrite/appwrite.dart';
import 'package:palm_task/core/network/app_write_client.dart';
import 'package:palm_task/core/utils/app_constants.dart';
import 'package:palm_task/features/data_list/data/models/data_model.dart';

abstract class RemoteDataSource {
  Future<List<DataModel>> getDataList();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppWriteClient appWriteClient;

  RemoteDataSourceImpl(this.appWriteClient);

  @override
  Future<List<DataModel>> getDataList() async {
    //Accessing list of documents from AppWrite databases instance
    try {
      final response = await appWriteClient.databases.listDocuments(
        databaseId: AppConstants.DATABASE_ID,
        collectionId: AppConstants.COLLECTION_ID,
      );
      return response.documents.map((d) => DataModel.fromJson(d.data)).toList();
    } on AppwriteException catch (e) {
      throw Exception('Failed to load data list: $e');
    }
  }
}
