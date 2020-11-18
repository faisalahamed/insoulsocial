import 'package:flutter/material.dart';
import 'package:insoulsocial/components/rounded_button.dart';
import 'package:insoulsocial/service/firebase_auth.dart';
import '../../widgets/header.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuthService _user = FirebaseAuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, titleText: "Profile"),
      body: Container(
          child: RoundedButton(
        press: () {
          _user.logout();
          Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false);
        },
        text: 'Signout',
      )),
    );
  }
}
