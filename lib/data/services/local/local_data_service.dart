import '../../../domain/models/user/user.dart';

class LocalDataService {
  // Future<List<Map<String, dynamic>>> _loadStringAsset(String asset) async {
  //   final localData = await rootBundle.loadString(asset);
  //   return (jsonDecode(localData) as List).cast<Map<String, dynamic>>();
  // }

  User getUser() {
    return const User(
      name: 'Sofie',
      // For demo purposes we use a local asset
      picture: 'assets/user.jpg',
    );
  }
}
