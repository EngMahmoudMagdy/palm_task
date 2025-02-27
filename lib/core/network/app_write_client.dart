import 'package:appwrite/appwrite.dart';

class AppWriteClient {
  final String projectId;

  final Client client;

  AppWriteClient({required this.client, required this.projectId}) {
    client.setProject(projectId);
  }

  Databases getDatabases() {
    return Databases(client);
  }
}
