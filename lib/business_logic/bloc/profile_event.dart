part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileUpdated extends ProfileEvent {
  final String name;
  final String surname;

  const ProfileUpdated(this.name, this.surname);

  @override
  List<Object> get props => [name, surname];
}
