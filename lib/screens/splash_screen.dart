import 'package:flutter/material.dart';
import 'package:keep_login/data/shared_prefs.dart';
import 'package:keep_login/screens/home_page.dart';

import 'login.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //Login olup olmadığımızı kontrol ediyoruz, login durumuna göre sayfa yönlendirmesi yapıyoruz.
  Future pageRotate() async {
    Future.delayed(Duration(seconds: 2), () {
      if (SharedPrefs.getLogin) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    HomePage(SharedPrefs.getMail, SharedPrefs.getPassword)));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      }
    });
  }

  @override
  void initState() {
    pageRotate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey.withOpacity(0.9),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              height: 150,
              width: 200,
              child: Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
