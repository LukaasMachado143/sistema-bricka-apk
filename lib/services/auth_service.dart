class AuthService{
  static bool _logged = false;

  static bool isLogged() {
    return _logged;
  }

  static void login(){
    _logged = true;
  }

  static void logout(){
    _logged = false;
  }

}