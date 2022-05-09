import 'dart:convert';

import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final String name;
  final String surname;

  const Profile(this.name, this.surname);

  Profile copyWith({
    String? name,
    String? surname,
  }) {
    return Profile(
      name ?? this.name,
      surname ?? this.surname,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'surname': surname,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      map['name'] ?? '',
      map['surname'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) =>
      Profile.fromMap(json.decode(source));

  @override
  List<Object> get props => [name, surname];
}
