import 'package:location/location.dart';

class UserLocation {
  static Future<LocationData> getLocation() async {
    var location = Location();

    var serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return Future.error("Usúario ativamente negou serviço de GPS");
      }
    }

    var permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return Future.error("Usúario ativamente negou permisão de GPS");
      }
    }

    return location.getLocation();
  }
}
