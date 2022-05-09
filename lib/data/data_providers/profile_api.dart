import 'package:bloc_example/data.dart';

class ProfileApi {
  Future<bool> updateProfile(Profile profile) async {
    // Simulating the action of sending user data
    // to the server and wait for the response
    await Future.delayed(const Duration(seconds: 3));
    
    return profile.name.isNotEmpty && profile.surname.isNotEmpty;
  }
}
