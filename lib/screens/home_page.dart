import 'package:flutter/material.dart';
import 'package:keep_login/data/shared_prefs.dart';
import 'package:keep_login/screens/login.dart';

class HomePage extends StatelessWidget {
  final String mail;
  final String password;
  HomePage(this.mail, this.password);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text(
          "Anasayfa",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          Padding(
            child: Center(
              child: IconButton(
                icon: Icon(
                  Icons.exit_to_app,
                  size: 40,
                  color: Colors.white,
                ),
                onPressed: () {
                  SharedPrefs.sharedClear();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                      (_) => false);
                },
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 15),
          ),
        ],
      ),
      body: Container(
        color: Colors.grey.withOpacity(0.4),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            labelCard("Hoşgeldiniz"),
            SizedBox(height: 20,),
            labelCard(mail),
            labelCard(password),
          ],
        ),
      ),
    );
  }

  Widget labelCard(String label) {
    return Text(
      label,
      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
    );
  }
}
