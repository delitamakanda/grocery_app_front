import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grocery_app_front/data/repository/location_repo.dart';
import 'package:grocery_app_front/models/address_model.dart';

class LocationController extends GetxController implements GetxService {
  LocationRepo locationRepo;
  LocationController({required this.locationRepo});
  bool _loading = false;
  late Position _position;
  late Position _pickPosition;
  Placemark _placemark = Placemark();
  Placemark _pickPlacemark = Placemark();
  List<AddressModel> _addressList = [];
  List<AddressModel> get addressList => _addressList;
  late List<AddressModel> _allAddressList;
  List<String> _addressTypeList = ["home", "work", "other"];
  int _addressTypeIndex = 0;
  late Map<String, dynamic> _getAddress;
  Map get getAddress => _getAddress;

  late GoogleMapController _mapController;
  bool _updateAddressData = true;
  bool _changeAddressData = true;

  bool get loading => _loading;
  Position get position => _position;
  Position get pickPosition => _pickPosition;

  void setMapController(GoogleMapController mapController) {
    _mapController = mapController;
  }

  void updatePosition(CameraPosition position, bool fromAddress) async {
    if (_updateAddressData) {
      _loading = true;
      update();
      try {
        if (fromAddress) {
          _position = Position(
              latitude: position.target.latitude,
              longitude: position.target.longitude,
              accuracy: 1,
              timestamp: DateTime.now(),
              altitude: 1,
              heading: 1,
              speed: 1,
              speedAccuracy: 1);
        } else {
          _pickPosition = Position(
              latitude: position.target.latitude,
              longitude: position.target.longitude,
              accuracy: 1,
              timestamp: DateTime.now(),
              altitude: 1,
              heading: 1,
              speed: 1,
              speedAccuracy: 1);
        }
        if (_changeAddressData) {
          String _address = await getAddressfromGeoCode(
              LatLng(position.target.latitude, position.target.longitude));
        }
      } catch (e) {
        print(e);
      }
    }
  }

  Future<String> getAddressfromGeoCode(LatLng latlng) async {
    String _address = "Unknow location found";

    Response response = await locationRepo.getAddressFromGeocode(latlng);
    if (response.body["status"] == "OK") {
      _address = response.body["results"][0]['formatted_address'].toString();
    } else {
      print('error from google api');
    }

    return _address;
  }
}
