import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:logger/logger.dart';
import 'package:vehicle_management_app/data/models/user/user_application.dart';
import 'package:vehicle_management_app/domain/usecases/application/get_applications_usecase.dart';
import 'package:vehicle_management_app/service_locator.dart';

part 'applicationlist_state.dart';

class ApplicationlistCubit extends HydratedCubit<ApplicationlistState> {
  ApplicationlistCubit() : super(ApplicationlistInitial());

  void clearApplications() {
    emit(ApplicationlistInitial());
  }

  Future<void> getApplications(
      bool self, String designation, String status, String branch) async {
    emit(ApplicationlistLoading());
    try {
      final applications = await sl<GetApplicationsUsecase>().call(
        params: self,
        designation: designation,
        status: status,
        branch: branch,
      );

      applications.fold(
        (l) => emit(ApplicationlistError(l.toString())),
        (r) {
          emit(ApplicationlistLoaded(r));
        },
      );
    } catch (e) {
      emit(ApplicationlistError(e.toString()));
    }
  }

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
