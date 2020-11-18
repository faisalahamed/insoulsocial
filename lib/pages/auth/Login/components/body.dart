import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insoulsocial/service/firebase_auth.dart';
import 'background.dart';
import '../../../../components/already_have_an_account_acheck.dart';
import '../../../../components/rounded_button.dart';
import '../../../../components/rounded_input_field.dart';
import '../../../../components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final FirebaseAuthService _user = FirebaseAuthService();

  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                email = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                password = value;
              },
            ),
            RoundedButton(
              text: "LOGIN",
              press: () async {
                UserCredential user =
                    // await _user.loginUsernamePassword(email, password);
                    await _user.loginUsernamePassword(
                        'admin@insoulit.com', '123456');
                if (user != null) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/dashboard', (_) => false);
                } else {
                  print('failed login trya again');
                }
              },
            ),
            RoundedButton(
              text: "annonymous login",
              press: () {
                // final FirebaseAuthService _user = FirebaseAuthService();
                //  _user.annonymouslogin();
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/signup', (_) => false),
            ),
          ],
        ),
      ),
    );
  }
}
