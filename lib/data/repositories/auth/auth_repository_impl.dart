import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vehicle_management_app/data/models/auth/create_user_req.dart';
import 'package:vehicle_management_app/data/models/auth/signin_user_req.dart';
import 'package:vehicle_management_app/data/sources/auth_firebase_service.dart';

import 'package:vehicle_management_app/domain/repositories/auth/auth.dart';

import '../../../service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    return await sl<AuthFirebaseService>().signin(signinUserReq);
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    return await sl<AuthFirebaseService>().signup(createUserReq);
  }

  @override
  Future<Either> getUser() async {
    return await sl<AuthFirebaseService>().getUser();
  }

  @override
  Future<Either> signout() {
    return sl<AuthFirebaseService>().signout();
  }
}
