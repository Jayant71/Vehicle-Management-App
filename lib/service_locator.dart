import 'package:get_it/get_it.dart';
import 'package:vehicle_management_app/data/repositories/auth/auth_repository_impl.dart';
import 'package:vehicle_management_app/data/repositories/vehicle/maintenance_repository_impl.dart.dart';
import 'package:vehicle_management_app/data/repositories/vehicle/refueling_repository_impl.dart';
import 'package:vehicle_management_app/data/repositories/vehicle/vehicle_repository_impl.dart';
import 'package:vehicle_management_app/data/sources/auth_firebase_service.dart';
import 'package:vehicle_management_app/data/sources/firebase_firestore_services.dart';
import 'package:vehicle_management_app/domain/repositories/auth/auth.dart';
import 'package:vehicle_management_app/domain/repositories/vehicle/maintenance.dart';
import 'package:vehicle_management_app/domain/repositories/vehicle/refueling.dart';
import 'package:vehicle_management_app/domain/repositories/vehicle/vehicle.dart';
import 'package:vehicle_management_app/domain/usecases/auth/get_user.dart';
import 'package:vehicle_management_app/domain/usecases/auth/sigin.dart';
import 'package:vehicle_management_app/domain/usecases/auth/signup.dart';
import 'package:vehicle_management_app/domain/usecases/vehicle/create_maintenance.dart';
import 'package:vehicle_management_app/domain/usecases/vehicle/create_refueling.dart';
import 'package:vehicle_management_app/domain/usecases/vehicle/create_vehicle_usecase.dart';
import 'package:vehicle_management_app/domain/usecases/vehicle/get_maintenance.dart';
import 'package:vehicle_management_app/domain/usecases/vehicle/get_maintenance_list.dart';
import 'package:vehicle_management_app/domain/usecases/vehicle/get_refueling.dart';
import 'package:vehicle_management_app/domain/usecases/vehicle/get_refueling_list.dart';
import 'package:vehicle_management_app/domain/usecases/vehicle/get_vehicle.dart';
import 'package:vehicle_management_app/domain/usecases/vehicle/get_vehicle_list.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  sl.registerSingleton<SignupUseCase>(SignupUseCase());

  sl.registerSingleton<SigninUseCase>(SigninUseCase());

  sl.registerSingleton<GetUserUseCase>(GetUserUseCase());

  sl.registerSingleton<FirestoreService>(FirestoreServiceImpl());
  sl.registerSingleton<VehicleRepository>(VehicleRepositoryImpl());

  sl.registerSingleton<RefuelingRepository>(RefuelingRepositoryImpl());
  sl.registerSingleton<MaintenanceRepository>(MaintenanceRepositoryImpl());

  sl.registerSingleton<CreateVehicleUsecase>(CreateVehicleUsecase());
  sl.registerSingleton<GetVehicleUsecase>(GetVehicleUsecase());
  sl.registerSingleton<GetVehicleListUsecase>(GetVehicleListUsecase());
  sl.registerSingleton<CreateMaintenanceUsecase>(CreateMaintenanceUsecase());
  sl.registerSingleton<CreateRefuelingUsecase>(CreateRefuelingUsecase());
  sl.registerSingleton<GetMaintenanceUsecase>(GetMaintenanceUsecase());
  sl.registerSingleton<GetRefuelingUsecase>(GetRefuelingUsecase());
  sl.registerSingleton<GetMaintenanceListUsecase>(GetMaintenanceListUsecase());
  sl.registerSingleton<GetRefuelingListUsecase>(GetRefuelingListUsecase());
}
