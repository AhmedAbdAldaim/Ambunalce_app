import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkInfo {
  // final InternetConnectionChecker internetConnectionChecker;
  // NetworkInfo({required this.internetConnectionChecker});
  final Connectivity connectivity;
  NetworkInfo({required this.connectivity});

  Future<bool> checkInternet() async {
    ConnectivityResult check = await connectivity.checkConnectivity();
    var isConnect =
        check == ConnectivityResult.mobile || check == ConnectivityResult.wifi;
    return isConnect;
  }

   Stream<ConnectivityResult> get onConnectivityChanged {
    return connectivity.onConnectivityChanged;
  }
}
