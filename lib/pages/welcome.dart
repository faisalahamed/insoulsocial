import 'package:flutter/material.dart';
import 'package:insoulsocial/models/user.dart';
import 'package:insoulsocial/pages/dashboard/dashboard.dart';
import 'package:insoulsocial/pages/login_signup/login_signup_page.dart';
import 'package:insoulsocial/service/firebase_auth.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  // bool isAuth = true;
  final FirebaseAuthService _user = FirebaseAuthService();
  MyUser logUser;
  bool isAuth = false;
  @override
  void initState() {
    super.initState();

    logUser = _user.logedcurrentUser();
    if (logUser == null) {
      isAuth = false;
    } else {
      isAuth = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(isAuth);
    return isAuth ? Dashboard() : LoginSignupPage();
  }
}
