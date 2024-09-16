import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:vehicle_management_app/data/models/user/user_application.dart';

part 'applicationlist_state.dart';

class ApplicationlistCubit extends HydratedCubit<ApplicationlistState> {
  ApplicationlistCubit() : super(ApplicationlistInitial());

  // Future<void> getApplications() async {
  //   emit(ApplicationlistLoading());
  //   try {
  //     final applications =
  //         await sl<>().getApplications();
  //     emit(ApplicationlistLoaded(applications));
  //   } catch (e) {
  //     emit(ApplicationlistError(e.toString()));
  //   }
  // }

  @override
  ApplicationlistState? fromJson(Map<String, dynamic> json) {
    final applications = (json['applications'] as List<dynamic>?)
        ?.map((e) => UserApplication.fromJson(e as Map<String, dynamic>))
        .toList();
    return applications != null
        ? ApplicationlistLoaded(applications)
        : ApplicationlistInitial();
  }

  @override
  Map<String, dynamic>? toJson(ApplicationlistState state) {
    if (state is ApplicationlistLoaded) {
      return {
        'applications': state.applications.map((e) => e.toJson()).toList(),
      };
    }
    return null;
  }
}
