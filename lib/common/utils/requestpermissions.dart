import 'package:permission_handler/permission_handler.dart';

class RequestPermissions {
  static Future<void> requestLocationPermission() async {
    var locationStatus = await Permission.location.status;
    if (locationStatus.isDenied) {
      await Permission.location.request();
    }
  }

  static Future<void> requestCameraPermission() async {
    var cameraStatus = await Permission.camera.status;
    if (cameraStatus.isDenied) {
      await Permission.camera.request();
    }
  }
}

class CheckPermissions {
  static Future<bool> checkLocationPermission() async {
    var locationStatus = await Permission.location.status;
    if (locationStatus.isGranted) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> checkCameraPermission() async {
    var cameraStatus = await Permission.camera.status;
    if (cameraStatus.isGranted) {
      return true;
    } else {
      return false;
    }
  }
}
