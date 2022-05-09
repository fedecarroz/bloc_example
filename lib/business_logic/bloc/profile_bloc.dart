import 'package:bloc/bloc.dart';
import 'package:bloc_example/data.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final profileRepository = ProfileRepository();

  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileUpdated>(
      (event, emit) async {
        emit(ProfileUpdateInProgress());

        final profile = Profile(
          event.name,
          event.surname,
        );

        await profileRepository.updateProfile(profile)
            ? emit(ProfileUpdateSuccess())
            : emit(ProfileUpdateFailure());
      },
    );
  }
}
