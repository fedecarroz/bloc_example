import 'package:bloc_example/data.dart';
import 'package:http/http.dart' as http;

class ProfileApi {
  Future<bool> updateProfile(Profile profile) async {
    // Simulating the action of sending user data
    // to the server and wait for the response
    await Future.delayed(const Duration(seconds: 3));

    return profile.name.isNotEmpty && profile.surname.isNotEmpty;
  }

  Future<http.Response> getUserTodos() async {
    const url = 'https://jsonplaceholder.typicode.com/users/1/todos';
    final response = await http.get(Uri.parse(url));
    return response;
  }
}
