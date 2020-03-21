import 'package:flutter/material.dart';
import 'package:keep_login/data/shared_prefs.dart';
import 'package:keep_login/screens/home_page.dart';
import 'package:keep_login/ui/helper/functions/regex_control.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool autoValidate = false;
  final formKey = GlobalKey<FormState>();
  var mailController = TextEditingController();
  var passwordController = TextEditingController();
  bool showPassword = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Ekranın her hangi bir yerine tıklayınca focus özelliğini kaybetmesi için yaptık.
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                Colors.amber.withOpacity(0.2),
                Colors.amber.withOpacity(0.2),
                Colors.amber.withOpacity(0.2),
              ],
            ),
          ),
          child: Column(
            children: <Widget>[
              _logo(),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(35),
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topLeft,
                      colors: [
                        Colors.blue.withOpacity(0.1),
                        Colors.blue.withOpacity(0.2),
                        Colors.blue.withOpacity(0.3),
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(35),
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    child: Form(
                      autovalidate: autoValidate,
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 5),
                          //Mail
                          myTextFormField("Mail", Icons.mail, mailController,
                              RegexKontrol.mailKontrol),
                          SizedBox(height: 15),
                          //Password
                          myTextFormField(
                            "Şifre",
                            Icons.lock,
                            passwordController,
                            RegexKontrol.passwordControl,
                          ),
                          SizedBox(height: 15),
                          _loginButton(context),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Ortak kullanılan text form field
  Widget myTextFormField(
    String labelText,
    IconData iconData,
    TextEditingController controller,
    Function function,
  ) {
    return TextFormField(
      validator: function,
      maxLines: 1,
      controller: controller,
      decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(
            iconData,
            size: 35,
            color: Colors.black,
          ),
          border: OutlineInputBorder()),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue.withOpacity(0.7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        onPressed: () {
          autoValidate = true;
          if (formKey.currentState.validate()) {
            //Form kontrolleri doğru ise gerekli bilgileri telefon hafızasına kayıt ediyoruz.
            formKey.currentState.save();
            SharedPrefs.saveMail(mailController.text);
            SharedPrefs.savePassword(passwordController.text);
            SharedPrefs.login();
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => HomePage(
                        mailController.text, passwordController.text)));
          }
        },
        child: Text(
          "Giriş Yap",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
      ),
    );
  }

  //login ekranında bulunan flutter türkiye logomuz
  Widget _logo() {
    return Padding(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            "assets/images/logo.png",
            width: MediaQuery.of(context).size.width * 0.35,
            height: MediaQuery.of(context).size.height * 0.15,
          ),
        ],
      ),
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.1,
        left: MediaQuery.of(context).size.height * 0.1,
      ),
    );
  }
}
