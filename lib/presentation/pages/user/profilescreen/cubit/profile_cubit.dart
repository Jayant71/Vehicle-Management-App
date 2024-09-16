import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends HydratedCubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  @override
  ProfileState? fromJson(Map<String, dynamic> json) {
    return ProfileInitial();
  }

  @override
  Map<String, dynamic>? toJson(ProfileState state) {
    return {};
  }
}
