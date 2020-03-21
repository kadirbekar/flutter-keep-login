//Login ekranında yapılan kontrolleri bir sınıf altında topladık.

class RegexKontrol {
  static String mailKontrol(String deger) {
    String tasarim =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(tasarim);
    if (deger.length == 0) {
      return "Email adresi gerekli";
    } else if (!regExp.hasMatch(deger)) {
      return "Geçersiz mail adresi";
    } else {
      return null;
    }
  }

  static String passwordControl(String value) {
    if (value.isEmpty) {
      return "Şifrenizi giriniz";
    }
    return null;
  }
}
