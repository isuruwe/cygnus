import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  static const String keyUserId = 'KEY_USER_ID';
  static const String keyUseremail = 'keyuseremail';
  static const String keyUsername = 'keyusername';
  static Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyUserId) ?? null;
  }
  static Future<String?> getemail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyUseremail) ?? null;
  }
  static Future<String?> getename() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyUsername) ?? null;
  }
  static Future<void> setUserId(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyUserId, id);
  }
  static Future<void> setEmail(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyUseremail, id);
  }
  static Future<void> setname(String? id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyUsername, id!);
  }
  static Future<void> removeUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(keyUserId);
    await prefs.remove(keyUsername);
    await prefs.remove(keyUseremail);
    await prefs.remove('user');

  }
}
