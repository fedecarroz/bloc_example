import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserTodo extends Equatable {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  const UserTodo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  UserTodo copyWith({
    int? userId,
    int? id,
    String? title,
    bool? completed,
  }) {
    return UserTodo(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'completed': completed,
    };
  }

  factory UserTodo.fromMap(Map<String, dynamic> map) {
    return UserTodo(
      userId: map['userId']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      completed: map['completed'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserTodo.fromJson(String source) =>
      UserTodo.fromMap(json.decode(source));

  @override
  List<Object?> get props => [userId, id, title, completed];
}
