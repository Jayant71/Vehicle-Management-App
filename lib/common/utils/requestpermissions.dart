import 'package:permission_handler/permission_handler.dart';

class RequestPermissions {
  static Future<void> requestLocationPermission() async {
    var locationStatus = await Permission.location.status;
    if (locationStatus.isDenied) {
      await Permission.location.request();
    }
    var cameraStatus = await Permission.camera.status;
    if (cameraStatus.isDenied) {
      await Permission.camera.request();
    }
  }
}
