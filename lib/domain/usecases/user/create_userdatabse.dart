import 'package:dartz/dartz.dart';
import 'package:vehicle_management_app/core/usecase/usecase.dart';
import 'package:vehicle_management_app/data/models/user/user.dart';
import 'package:vehicle_management_app/data/sources/firebase_firestore_services.dart';
import 'package:vehicle_management_app/service_locator.dart';

class CreateUserdatabseUseCase extends UseCase<Either, UserModel> {
  @override
  Future<Either> call({UserModel? params}) async {
    return sl<FirestoreService>().createUserDatabase(params!);
  }
}
