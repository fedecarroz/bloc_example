import 'dart:convert';

import 'package:bloc_example/data.dart';
import 'package:bloc_example/data/models/user_todo.dart';

class ProfileRepository {
  final profileApi = ProfileApi();

  Future<bool> updateProfile(String name, String surname) async {
    final profile = Profile(name, surname);
    final updateSuccess = await profileApi.updateProfile(profile);
    return updateSuccess;
  }

  Future<List<UserTodo>> getUserTodos() async {
    final response = await profileApi.getUserTodos();
    final body = jsonDecode(response.body);
    var rawData = List<Map<String, dynamic>>.from(body);
    var todoList = <UserTodo>[];
    for (var element in rawData) {
      var userTodo = UserTodo.fromMap(element);
      todoList.add(userTodo);
    }
    return todoList;
  }
}
