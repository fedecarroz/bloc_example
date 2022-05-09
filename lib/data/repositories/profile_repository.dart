import 'package:bloc_example/data.dart';

class ProfileRepository {
  final profileApi = ProfileApi();

  Future<bool> updateProfile(Profile profile) async {
    final check = await profileApi.updateProfile(profile);
    return check;
  }
}
