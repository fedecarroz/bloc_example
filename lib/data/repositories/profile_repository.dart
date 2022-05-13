import 'package:bloc_example/data.dart';

class ProfileRepository {
  final profileApi = ProfileApi();

  Future<bool> updateProfile(String name, String surname) async {
    final profile = Profile(name, surname);
    final updateSuccess = await profileApi.updateProfile(profile);
    return updateSuccess;
  }
}
