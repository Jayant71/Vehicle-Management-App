import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:vehicle_management_app/data/models/feedback/feedback.dart';
import 'package:vehicle_management_app/data/models/user/driver.dart';
import 'package:vehicle_management_app/data/models/user/user.dart';
import 'package:vehicle_management_app/data/models/user/user_application.dart';
import 'package:vehicle_management_app/data/models/vehicle/maintenance_record.dart';
import 'package:vehicle_management_app/data/models/vehicle/refueling_record.dart';
import 'package:vehicle_management_app/data/models/vehicle/vehicle.dart';

abstract class FirestoreService {
  // User
  Future<Either> createUserDatabase(UserModel userModel);
  Future<Either> deleteUserDatabase(String id);
  Future<Either> getUser(String id);
  Future<Either> getUserList();
  Future<Either> updateUserRole(String id, String role);
  Future<Either> updateUserDatabase(String id, Map<String, dynamic> fields);
  Future<Either> createDriverDatabase(DriverModel driverModel);
  Future<Either> getDriverList();
  Future<Either> getDriver(String id);
  // Vehicle
  Future<Either> createVehicleDatabase(VehicleModel vehicleModel);
  Future<Either> deleteVehicleDatabase(String id);
  Future<Either> getVehicle(String id);
  Future<Either> getVehicleList();

  // Maintenance
  Future<Either> createMaintenanceDatabase(MaintenanceRecord maintenanceModel);
  Future<Either> getMaintenance(String id);
  Future<Either> getMaintenanceList(String vehicleId);
  Future<Either> getMaintenanceListByDriver(String driverId);

  // Refueling
  Future<Either> createRefuelingDatabase(RefuelingRecord refuelingModel);
  Future<Either> getRefueling(String id);
  Future<Either> getRefuelingList(String vehicleId);
  Future<Either> getRefuelingListByDriver(String driverId);

  // Applications
  Future<Either> createApplication(UserApplication userApplication);
  Future<Either> updateApplication(String id, Map<String, dynamic> fields);
  Future<Either> getApplications(bool self, String designation);
  Future<Either> getApplication(String id);
  Future<Either> getSelfApplications(String userId, String status);
  Future<Either> getBranchApplications(String branch, String status);

  // Feedback
  Future<Either> createFeedback(FeedbackModel feedbackModel);
  Future<Either> getFeedback(String id);
  Future<Either> getFeedbackList(String type);
  Future<Either> updateFeedback(String id, Map<String, dynamic> fields);
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
  Future<Either> getUser(String id) async {
    String message = '';
    try {
      var auth = FirebaseAuth.instance;
      if (id == '') {
        id = auth.currentUser!.uid;
      }
      var user =
          await FirebaseFirestore.instance.collection('users').doc(id).get();
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
          .doc(vehicleModel.vehicleId)
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
          .collection('maintenance')
          .doc(maintenanceModel.maintenanceId)
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
          .collection('refueling')
          .doc(refuelingModel.refuelingId)
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
      var maintenance = await FirebaseFirestore.instance
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
      var refueling = await FirebaseFirestore.instance
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

  @override
  Future<Either> getMaintenanceListByDriver(String driverId) async {
    String message = '';
    try {
      // var auth = FirebaseAuth.instance;
      var maintenances = await FirebaseFirestore.instance
          .collection('maintenance')
          .where('driverId', isEqualTo: driverId)
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
  Future<Either> getRefuelingListByDriver(String driverId) async {
    String message = '';
    try {
      // var auth = FirebaseAuth.instance;
      var refuelings = await FirebaseFirestore.instance
          .collection('refueling')
          .where('driverId', isEqualTo: driverId)
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

  @override
  Future<Either> updateUserRole(String id, String role) async {
    String message = '';
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(id)
          .update({'role': role});
      message = 'User role updated successfully';
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
  Future<Either> getDriver(String id) async {
    String message = '';
    try {
      var id_ = FirebaseAuth.instance.currentUser!.email
          .toString()
          .split('@')[0]
          .split('.')[1]
          .toUpperCase();
      var driver =
          await FirebaseFirestore.instance.collection('drivers').doc(id_).get();
      DriverModel driverModel = DriverModel.fromJson(driver.data()!);
      return Right(driverModel);
    } on FirebaseException catch (e) {
      message = e.toString();
      return Left(message);
    } catch (e) {
      message = e.toString();
      return Left(message);
    }
  }

  @override
  Future<Either> getDriverList() async {
    String message = '';
    try {
      var drivers =
          await FirebaseFirestore.instance.collection('drivers').get();
      List<DriverModel> driverList = [];
      for (var driver in drivers.docs) {
        driverList.add(DriverModel.fromJson(driver.data()));
      }
      return Right(driverList);
    } on FirebaseException catch (e) {
      message = e.toString();
      return Left(message);
    } catch (e) {
      message = e.toString();
      return Left(message);
    }
  }

  @override
  Future<Either> createApplication(UserApplication userApplication) async {
    String message = '';

    try {
      await FirebaseFirestore.instance
          .collection('user_applications')
          .doc(userApplication.bookingId)
          .set(userApplication.toJson());
      message = 'Success';
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
  Future<Either> updateApplication(
      String id, Map<String, dynamic> fields) async {
    String message = '';
    try {
      await FirebaseFirestore.instance
          .collection('user_applications')
          .doc(id)
          .update(fields);
      message = 'Application updated successfully';
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
  Future<Either> getApplication(String id) async {
    String message = '';
    try {
      var application = await FirebaseFirestore.instance
          .collection('user_applications')
          .doc(id)
          .get();
      UserApplication userApplication =
          UserApplication.fromJson(application.data()!);
      return Right(userApplication);
    } on FirebaseException catch (e) {
      message = e.toString();
      return Left(message);
    } catch (e) {
      message = e.toString();
      return Left(message);
    }
  }

  @override
  Future<Either> getApplications(bool self, String designation) async {
    String message = '';

    try {
      if (designation == 'user') {
        var applcations = await FirebaseFirestore.instance
            .collection('user_applications')
            .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .get();
        List<UserApplication> pendingApplicationList = [];
        List<UserApplication> approvedApplicationList = [];
        List<UserApplication> rejectedApplications = [];

        for (var application in applcations.docs) {
          if (application.data()['status'] == 3 ||
              application.data()['status'] == 2) {
            pendingApplicationList
                .add(UserApplication.fromJson(application.data()));
          } else if (application.data()['status'] == -1) {
            rejectedApplications
                .add(UserApplication.fromJson(application.data()));
          } else {
            approvedApplicationList
                .add(UserApplication.fromJson(application.data()));
          }
        }
        return Right([
          pendingApplicationList,
          approvedApplicationList,
          rejectedApplications
        ]);
      } else if (designation == 'hod') {
        final user = await getUser('');
        var department = '';
        user.fold((l) => Logger().e(l), (r) {
          department = r.department;
        });
        var applications = await FirebaseFirestore.instance
            .collection('user_applications')
            .where(Filter(
              'department',
              isEqualTo: department,
            ))
            .where(Filter(
              'status',
              isLessThanOrEqualTo: 3,
            ))
            .get();

        List<UserApplication> pendingApplications = [];
        List<UserApplication> approvedApplications = [];
        List<UserApplication> rejectedApplications = [];
        for (var application in applications.docs) {
          if (application.data()['status'] == 3) {
            if (self) {
              if (application.data()['userId'] ==
                  FirebaseAuth.instance.currentUser!.uid) {
                pendingApplications
                    .add(UserApplication.fromJson(application.data()));
              }
            } else {
              pendingApplications
                  .add(UserApplication.fromJson(application.data()));
            }
          } else if (application.data()['status'] == -1) {
            if (self) {
              if (application.data()['userId'] ==
                  FirebaseAuth.instance.currentUser!.uid) {
                rejectedApplications
                    .add(UserApplication.fromJson(application.data()));
              } else {
                rejectedApplications
                    .add(UserApplication.fromJson(application.data()));
              }
            }
          } else {
            if (self) {
              if (application.data()['userId'] ==
                  FirebaseAuth.instance.currentUser!.uid) {
                approvedApplications
                    .add(UserApplication.fromJson(application.data()));
              }
            } else {
              approvedApplications
                  .add(UserApplication.fromJson(application.data()));
            }
          }
        }
        return Right(
            [pendingApplications, approvedApplications, rejectedApplications]);
      } else if (designation == 'allocator') {
        var applications = await FirebaseFirestore.instance
            .collection('user_applications')
            .where('status', isLessThan: 3)
            .get();

        List<UserApplication> pendingApplications = [];
        List<UserApplication> approvedApplications = [];
        List<UserApplication> rejectedApplications = [];

        for (var application in applications.docs) {
          if (application.data()['status'] == 2) {
            pendingApplications
                .add(UserApplication.fromJson(application.data()));
          } else if (application.data()['status'] == -1) {
            rejectedApplications
                .add(UserApplication.fromJson(application.data()));
          } else {
            approvedApplications
                .add(UserApplication.fromJson(application.data()));
          }
        }

        return Right(
            [pendingApplications, approvedApplications, rejectedApplications]);
      } else if (designation == 'driver') {
        var id = FirebaseAuth.instance.currentUser!.email
            .toString()
            .split('@')[0]
            .split('.')[1];
        var applications = await FirebaseFirestore.instance
            .collection('user_applications')
            .where('driverId', isEqualTo: id)
            .get();
        List<UserApplication> pendingTasks = [];
        List<UserApplication> completedTasks = [];

        for (var application in applications.docs) {
          if (application.data()['status'] == 1) {
            pendingTasks.add(UserApplication.fromJson(application.data()));
          } else if (application.data()['status'] == 0) {
            completedTasks.add(UserApplication.fromJson(application.data()));
          }
        }

        return Right([pendingTasks, completedTasks]);
      } else if (designation == "admin") {
        var applications = await FirebaseFirestore.instance
            .collection('user_applications')
            .get();
        List<UserApplication> pendingApplication = [];
        List<UserApplication> completedApplication = [];
        List<UserApplication> rejectedApplication = [];

        for (var application in applications.docs) {
          if (application.data()['status'] <= 3 &&
              application.data()['status'] != 0) {
            pendingApplication
                .add(UserApplication.fromJson(application.data()));
          } else if (application.data()['status'] == -1) {
            rejectedApplication
                .add(UserApplication.fromJson(application.data()));
          } else if (application.data()['status'] == 0) {
            completedApplication
                .add(UserApplication.fromJson(application.data()));
          }
        }
        return Right(
            [pendingApplication, completedApplication, rejectedApplication]);
      } else {
        return const Right([]);
      }
    } on FirebaseException catch (e) {
      message = e.toString();
      return Left(message);
    } catch (e) {
      message = e.toString();
      return Left(message);
    }
  }

  @override
  Future<Either> getSelfApplications(String userId, String status) async {
    String message = '';
    dynamic applications;
    try {
      if (status == "accepted") {
        applications = await FirebaseFirestore.instance
            .collection('user_applications')
            .where('userId', isEqualTo: userId)
            .get();
      } else {
        applications = await FirebaseFirestore.instance
            .collection('user_applications')
            .where('userId', isEqualTo: userId)
            .where('accepted', isEqualTo: status)
            .get();
      }
      List<UserApplication> applicationList = [];
      for (var application in applications.docs) {
        applicationList.add(UserApplication.fromJson(application.data()));
      }
      return Right(applicationList);
    } on FirebaseException catch (e) {
      message = e.toString();
      return Left(message);
    } catch (e) {
      message = e.toString();
      return Left(message);
    }
  }

  @override
  Future<Either> getBranchApplications(String branch, String status) async {
    String message = '';
    dynamic applications;
    try {
      applications = FirebaseFirestore.instance
          .collection('user_applications')
          .where('branch', isEqualTo: branch)
          .where('status', isEqualTo: status)
          .get();
      List<UserApplication> applicationList = [];
      for (var application in applications.docs) {
        applicationList.add(UserApplication.fromJson(application.data()));
      }
      return Right(applicationList);
    } on FirebaseException catch (e) {
      message = e.toString();
      return Left(message);
    } catch (e) {
      message = e.toString();
      return Left(message);
    }
  }

  @override
  Future<Either> createDriverDatabase(DriverModel driverModel) async {
    String message = '';
    try {
      await FirebaseFirestore.instance
          .collection('drivers')
          .doc(driverModel.driverId)
          .set(driverModel.toJson());
      message = 'Driver created successfully';
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
  Future<Either> createFeedback(FeedbackModel feedbackModel) async {
    String message = '';
    try {
      await FirebaseFirestore.instance
          .collection('feedback')
          .doc()
          .set(feedbackModel.toJson());
      message = 'Feedback created successfully';
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
  Future<Either> getFeedback(String id) async {
    String message = '';
    try {
      var feedback =
          await FirebaseFirestore.instance.collection('feedback').doc(id).get();
      FeedbackModel feedbackModel = FeedbackModel.fromJson(feedback.data()!);
      return Right(feedbackModel);
    } on FirebaseException catch (e) {
      message = e.toString();
      return Left(message);
    } catch (e) {
      message = e.toString();
      return Left(message);
    }
  }

  @override
  Future<Either> getFeedbackList(String type) async {
    String message = '';
    try {
      var feedbacks = await FirebaseFirestore.instance
          .collection('feedback')
          .where('type', isEqualTo: type)
          .get();
      List<FeedbackModel> feedbackList = [];
      for (var feedback in feedbacks.docs) {
        feedbackList.add(FeedbackModel.fromJson(feedback.data()));
      }
      return Right(feedbackList);
    } on FirebaseException catch (e) {
      message = e.toString();
      return Left(message);
    } catch (e) {
      message = e.toString();
      return Left(message);
    }
  }

  @override
  Future<Either> updateFeedback(String id, Map<String, dynamic> fields) async {
    String message = '';
    try {
      await FirebaseFirestore.instance
          .collection('feedback')
          .doc(id)
          .update(fields);
      message = 'Feedback updated successfully';
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
  Future<Either> updateUserDatabase(
      String id, Map<String, dynamic> fields) async {
    String message = '';
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(id)
          .update(fields);
      message = 'User updated successfully';
      return Right(message);
    } on FirebaseException catch (e) {
      message = e.toString();
      return Left(message);
    } catch (e) {
      message = e.toString();
      return Left(message);
    }
  }
}
