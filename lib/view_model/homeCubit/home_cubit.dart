import 'dart:async';
import 'package:ambulance/core/app_styles.dart';
import 'package:ambulance/core/service_locator.dart';
import 'package:ambulance/data/data_sourse/local/shared_prefrence.dart';
import 'package:ambulance/view_model/homeCubit/home_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loctionImp;
import 'package:permission_handler/permission_handler.dart';

import '../../core/helper/network_info.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitHomeState());
  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  late CameraPosition initialCameraPosition;
  GoogleMapController? googleMapController;
  late PermissionStatus status;
  double? latitude;
  double? longitude;
  loctionImp.Location location = loctionImp.Location();
  bool? serviceEnabled;
  MapType mapType = MapType.normal;

  bool isconnect = false;

  checkConnection(context) async {
    getIt.get<NetworkInfo>().onConnectivityChanged.listen((r) {
      if (r == ConnectivityResult.mobile || r == ConnectivityResult.wifi) {
        isconnect = true;
        requestPermission(context);
      } else {
        isconnect = false;

        emit(CheckconnectionState());
      }

      emit(CheckconnectionState());
    });
  }

  Future<void> requestPermission(context) async {
    status = await Permission.location.request();
    if (status.isGranted) {
      debugPrint('Permission granted');
      await requestEnableLocation(context);
      emit(RequestPermissionState());
    } else if (status.isDenied) {
      requestPermission(context);
      showEnableLocationSnackbar(
        context,
        'لن نتمكن من الوصول لموقعك , الرجاء السماح بالوصول لموقعك!',
      );
      debugPrint('Permission denied');
      emit(PermissionDeniedState());
    } else if (status.isPermanentlyDenied) {
      debugPrint('PermanentlyDenied denied');
      Fluttertoast.showToast(
          msg: "قم بتفعيل اذن الوصول للموقع الجغرافي",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      openAppSettings();
      emit(PermissionPermanentlyDeniedState());
    }
  }

  Future<void> requestEnableLocation(context) async {
    if (status == PermissionStatus.granted) {
      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled!) {
        serviceEnabled = await location.requestService();
        Future.delayed(const Duration(seconds: 1), () async {
          if (!serviceEnabled!) {
            showEnableLocationSnackbar(
              context,
              'لن نتمكن من الوصول لموقعك , الرجاء تفعيل الموقع!',
            );
            requestEnableLocation(context);
          } else {
            await getLocation();
            emit(RequestEnableLocationState());
          }
        });
      } else {
        await getLocation();
        emit(RequestEnableLocationState());
      }
      emit(RequestEnableLocationState());
    } else {
      await requestPermission(context);
    }
  }

  /// Show a snackbar if location services are disabled.
  void showEnableLocationSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: AppStyles.textstyle03,
          textDirection: TextDirection.rtl,
        ),
      ),
    );
  }

  /// Set the GoogleMapController after it's initialized.
  void setGoogleMapController(GoogleMapController controller) {
    googleMapController = controller;
    emit(GoogleMapControllerInitializedState());
  }

  /// Get LatLang Location
  var pref = getIt.get<SharedPrefrencesHelper>();
  Future<void> getLocation() async {
    try {
      loctionImp.LocationData locationData = await location.getLocation();
      latitude = locationData.latitude;
      longitude = locationData.longitude;
      pref.setData(key: 'lat', value: latitude);
      pref.setData(key: 'lng', value: longitude);
      print('============================');

      debugPrint("Latitude: $latitude, Longitude: $longitude");
      moveToCurrentLocation();
      emit(RequestGetLocationSuccessState());
    } catch (e) {
      debugPrint("Error: $e");
      emit(
        RequestGetLocationFailureState(
          message: 'لم نتمكن من جلب الاحداثيات حاول مرة اخرى',
        ),
      );
    }
  }

  /// Move the map camera to the current user location (if available).
  Future<void> moveToCurrentLocation() async {
    if (googleMapController != null && latitude != null && longitude != null) {
      final position = CameraPosition(
        target: LatLng(pref.getData(key: 'lat'), pref.getData(key: 'lng')!),
        zoom: 18.0,
      );
      googleMapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          position,
        ),
      );
      List<Placemark> placemarks = await placemarkFromCoordinates(
        pref.getData(key: 'lat'),
        pref.getData(key: 'lng'),
      );
      var p = placemarks.first;
      pref.setData(
        key: 'location',
        value: '${p.locality} , ${p.subLocality} , ${p.name} , ${p.street}',
      );

      emit(MoveToCurrentLocationState());
    } else {
      emit(LocationNotAvailableState());
    }
  }

  /// Styles Map
  String mapStyle = '';
  Future<void> loadMapStyles() async {
    // تحميل نمط الليل من ملف JSON
    mapStyle = await rootBundle.loadString('assets/map_style_night.json');
  }

// change Map Type
  void changeMapType() {
    if (mapType == MapType.normal) {
      mapType = MapType.satellite;
    } else {
      mapType = MapType.normal;
    }
    emit(MoveToCurrentLocationState());
  }
}
