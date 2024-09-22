import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:vehicle_management_app/data/models/user/user.dart';
import 'package:vehicle_management_app/domain/usecases/auth/get_user.dart';
import 'package:vehicle_management_app/service_locator.dart';

class ProfileCubit extends HydratedCubit<UserModel?> {
  ProfileCubit() : super(null);

  Future<void> getUserProfile() async {
    final result = await sl<GetUserUseCase>().call();
    result.fold(
      (l) => emit(null),
      (r) => emit(r),
    );
  }

  @override
  UserModel? fromJson(Map<String, dynamic> json) {
    return UserModel.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(UserModel? state) {
    return state?.toJson();
  }
}
