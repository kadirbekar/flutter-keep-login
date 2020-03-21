import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  //Shared preferences nesnesi oluşmuşsa aynı nesneyi tekrar çağırıyoruz.
  static SharedPreferences _prefs;
  static initialize() async {
    if (_prefs != null) {
      return _prefs;
    } else {
      _prefs = await SharedPreferences.getInstance();
    }
  }

  //Shared prefs üzerine mail adresini kayıt ediyoruz
  static Future<void> saveMail(String mail) async {
    return _prefs.setString('mail', mail);
  }

  //Shared prefs üzerine şifreyi kayıt ediyoruz
  static Future<void> savePassword(String password) async {
    return _prefs.setString("password", password);
  }

  //Kayıtlı verileri siler
  static Future<void> sharedClear() async {
    return _prefs.clear();
  }

  //Login bilgisini tutar
  static Future<void> login() async {
    return _prefs.setBool('login', true);
  }

  //Kayıtlı verileri alıyoruz
  static String get getMail => _prefs.getString("mail") ?? "null";
  static String get getPassword => _prefs.getString("password") ?? "null";
  static bool get getLogin => _prefs.getBool('login') ?? false;
}
