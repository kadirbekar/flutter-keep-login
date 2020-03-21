import 'package:flutter/material.dart';
import 'data/shared_prefs.dart';
import 'screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Uygulama yüklenirken kayıtlı verileri alıyoruz.
  await SharedPrefs.initialize();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}
