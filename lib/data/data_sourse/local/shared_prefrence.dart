import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrencesHelper {
  final SharedPreferences pref;
  SharedPrefrencesHelper({required this.pref});

  Future<bool> setData({required String key, required dynamic value}) {
    switch (value.runtimeType) {
      case == String:
        return pref.setString(key, value);
      case == int:
        return pref.setInt(key, value);
      case == bool:
        return pref.setBool(key, value);
      default:
        return pref.setDouble(key, value);
    }
  }

  dynamic getData({required String key}) {
    return pref.get(key);
  }

  Future<bool> cleardata() async{
  return await pref.clear();
  }
}
