import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vehicle_management_app/data/models/user/user.dart';
import 'package:vehicle_management_app/data/models/vehicle/maintenance_record.dart';
import 'package:vehicle_management_app/data/models/vehicle/refueling_record.dart';
import 'package:vehicle_management_app/data/models/vehicle/vehicle.dart';

abstract class FirestoreService {
  // User
  Future<Either> createUserDatabase(UserModel userModel);
  Future<Either> deleteUserDatabase(String id);
  Future<Either> getUser();
  Future<Either> getUserList();

  // Vehicle
  Future<Either> createVehicleDatabase(VehicleModel vehicleModel);
  Future<Either> deleteVehicleDatabase(String id);
  Future<Either> getVehicle(String id);
  Future<Either> getVehicleList();

  // Maintenance
  Future<Either> createMaintenanceDatabase(MaintenanceRecord maintenanceModel);
  // Future<Either> deleteMaintenanceDatabase(String id);
  Future<Either> getMaintenance(String id);
  Future<Either> getMaintenanceList(String vehicleId);

  // Refueling
  Future<Either> createRefuelingDatabase(RefuelingRecord refuelingModel);
  // Future<Either> deleteRefuelingDatabase(String id);
  Future<Either> getRefueling(String id);
  Future<Either> getRefuelingList(String vehicleId);
}

class FirestoreServiceImpl implements FirestoreService {
  @override
  Future<Either> createUserDatabase(UserModel userModel) async {
    String message = '';
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userModel.uid)
          .set(userModel.toJson());
      message = 'User created successfully';
      return Right(message);
    } on FirebaseException catch (e) {
      message = e.toString();
      return Left(message);
    } catch (e) {
      message = e.toString();
      return Left(message);
    }
  }

  @override
  Future<Either> deleteUserDatabase(String id) async {
    String message = '';
    try {
      await FirebaseFirestore.instance.collection('users').doc(id).delete();
      message = 'User deleted successfully';
      return Right(message);
    } on FirebaseException catch (e) {
      message = e.toString();
      return Left(message);
    } catch (e) {
      message = e.toString();
      return Left(message);
    }
  }

  @override
  Future<Either> getUser() async {
    String message = '';
    try {
      var auth = FirebaseAuth.instance;

      var user = await FirebaseFirestore.instance
          .collection('users')
          .doc(auth.currentUser?.uid.toString())
          .get();
      UserModel userModel = UserModel.fromJson(user.data()!);
      return Right(userModel);
    } on FirebaseException catch (e) {
      message = e.toString();
      return Left(message);
    } catch (e) {
      message = e.toString();
      return Left(message);
    }
  }

  @override
  Future<Either> getUserList() async {
    String message = '';
    try {
      var users = await FirebaseFirestore.instance.collection('users').get();
      List<UserModel> userList = [];
      for (var user in users.docs) {
        userList.add(UserModel.fromJson(user.data()));
      }
      return Right(userList);
    } on FirebaseException catch (e) {
      message = e.toString();
      return Left(message);
    } catch (e) {
      message = e.toString();
      return Left(message);
    }
  }

  @override
  Future<Either> createVehicleDatabase(VehicleModel vehicleModel) async {
    String message = '';
    try {
      await FirebaseFirestore.instance
          .collection('vehicles')
          .doc(vehicleModel.id)
          .set(vehicleModel.toJson());
      message = 'Vehicle created successfully';
      return Right(message);
    } on FirebaseException catch (e) {
      message = e.toString();
      return Left(message);
    } catch (e) {
      message = e.toString();
      return Left(message);
    }
  }

  @override
  Future<Either> deleteVehicleDatabase(String id) async {
    String message = '';
    try {
      await FirebaseFirestore.instance.collection('vehicles').doc(id).delete();
      message = 'Vehicle deleted successfully';
      return Right(message);
    } on FirebaseException catch (e) {
      message = e.toString();
      return Left(message);
    } catch (e) {
      message = e.toString();
      return Left(message);
    }
  }

  @override
  Future<Either> getVehicle(String id) async {
    String message = '';
    try {
      var vehicle =
          await FirebaseFirestore.instance.collection('vehicles').doc(id).get();
      VehicleModel vehicleModel = VehicleModel.fromJson(vehicle.data()!);
      return Right(vehicleModel);
    } on FirebaseException catch (e) {
      message = e.toString();
      return Left(message);
    } catch (e) {
      message = e.toString();
      return Left(message);
    }
  }

  @override
  Future<Either> getVehicleList() async {
    String message = '';
    try {
      var vehicles =
          await FirebaseFirestore.instance.collection('vehicles').get();
      List<VehicleModel> vehicleList = [];
      for (var vehicle in vehicles.docs) {
        vehicleList.add(VehicleModel.fromJson(vehicle.data()));
      }
      return Right(vehicleList);
    } on FirebaseException catch (e) {
      message = e.toString();
      return Left(message);
    } catch (e) {
      message = e.toString();
      return Left(message);
    }
  }

  @override
  Future<Either> createMaintenanceDatabase(
      MaintenanceRecord maintenanceModel) async {
    String message = '';
    try {
      var auth = FirebaseAuth.instance;
      maintenanceModel.userId = auth.currentUser!.uid.toString();
      await FirebaseFirestore.instance
          .collection('user')
          .doc(maintenanceModel.userId)
          .collection('maintenance')
          .doc(maintenanceModel.id)
          .set(maintenanceModel.toJson());
      message = 'Maintenance created successfully';
      return Right(message);
    } on FirebaseException catch (e) {
      message = e.toString();
      return Left(message);
    } catch (e) {
      message = e.toString();
      return Left(message);
    }
  }

  @override
  Future<Either> createRefuelingDatabase(RefuelingRecord refuelingModel) async {
    String message = '';
    try {
      var auth = FirebaseAuth.instance;
      refuelingModel.userId = auth.currentUser!.uid.toString();
      await FirebaseFirestore.instance
          .collection('user')
          .doc(refuelingModel.userId)
          .collection('refueling')
          .doc(refuelingModel.id)
          .set(refuelingModel.toJson());
      message = 'Refueling created successfully';
      return Right(message);
    } on FirebaseException catch (e) {
      message = e.toString();
      return Left(message);
    } catch (e) {
      message = e.toString();
      return Left(message);
    }
  }

  @override
  Future<Either> getMaintenance(String id) async {
    String message = '';
    try {
      var auth = FirebaseAuth.instance;
      var maintenance = await FirebaseFirestore.instance
          .collection('user')
          .doc(auth.currentUser!.uid.toString())
          .collection('maintenance')
          .doc(id)
          .get();
      MaintenanceRecord maintenanceRecord =
          MaintenanceRecord.fromJson(maintenance.data()!);
      return Right(maintenanceRecord);
    } on FirebaseException catch (e) {
      message = e.toString();
      return Left(message);
    } catch (e) {
      message = e.toString();
      return Left(message);
    }
  }

  @override
  Future<Either> getMaintenanceList(String vehicleId) async {
    String message = '';
    try {
      // var auth = FirebaseAuth.instance;
      var maintenances = await FirebaseFirestore.instance
          .collection('user')
          .doc()
          .collection('maintenance')
          .where('vehicleId', isEqualTo: vehicleId)
          .get();
      List<MaintenanceRecord> maintenanceList = [];
      for (var maintenance in maintenances.docs) {
        maintenanceList.add(MaintenanceRecord.fromJson(maintenance.data()));
      }
      return Right(maintenanceList);
    } on FirebaseException catch (e) {
      message = e.toString();
      return Left(message);
    } catch (e) {
      message = e.toString();
      return Left(message);
    }
  }

  @override
  Future<Either> getRefueling(String id) async {
    String message = '';
    try {
      var auth = FirebaseAuth.instance;
      var refueling = await FirebaseFirestore.instance
          .collection('user')
          .doc(auth.currentUser!.uid.toString())
          .collection('refueling')
          .doc(id)
          .get();
      RefuelingRecord refuelingRecord =
          RefuelingRecord.fromJson(refueling.data()!);
      return Right(refuelingRecord);
    } on FirebaseException catch (e) {
      message = e.toString();
      return Left(message);
    } catch (e) {
      message = e.toString();
      return Left(message);
    }
  }

  @override
  Future<Either> getRefuelingList(String vehicleId) async {
    String message = '';
    try {
      // var auth = FirebaseAuth.instance;
      var refuelings = await FirebaseFirestore.instance
          .collection('user')
          .doc()
          .collection('refueling')
          .where('vehicleId', isEqualTo: vehicleId)
          .get();
      List<RefuelingRecord> refuelingList = [];
      for (var refueling in refuelings.docs) {
        refuelingList.add(RefuelingRecord.fromJson(refueling.data()));
      }
      return Right(refuelingList);
    } on FirebaseException catch (e) {
      message = e.toString();
      return Left(message);
    } catch (e) {
      message = e.toString();
      return Left(message);
    }
  }
}
