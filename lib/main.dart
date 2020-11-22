import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:insoulsocial/pages/welcome.dart';
import 'package:insoulsocial/route_generator.dart';
import 'package:splashscreen/splashscreen.dart';

import 'helpers/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: kPrimaryColor, scaffoldBackgroundColor: Colors.white),
      home: SplashScreen(
        seconds: 1,
        // navigateAfterSeconds: LoginPage(),
        navigateAfterSeconds: WelcomePage(),
        title: new Text(
          'Welcome In SplashScreen',
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        image: new Image.network(
            'https://insoulit.com//storage/settings/February2020/iwWBR4Jicza64wd6l2vy.png'),
        backgroundColor: Colors.cyanAccent,
        loaderColor: Colors.red,
        photoSize: 120.0,
        loadingText: Text("Loading....."),
      ),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
