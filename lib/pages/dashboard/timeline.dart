import 'package:flutter/material.dart';
import 'package:insoulsocial/models/user.dart';
import 'package:insoulsocial/service/firebase_auth.dart';
import '../../widgets/header.dart';

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  final FirebaseAuthService _user = FirebaseAuthService();
  MyUser logUser;
  @override
  void initState() {
    super.initState();
    logUser = _user.logedcurrentUser();
    if (logUser == null) {
      Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false);
    }
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: header(context, isAppTitle: true),
      body: Text('user: ${logUser.email}'),
    );
  }
}
