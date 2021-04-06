import 'package:app_censo/components/rounded_button.dart';
import 'package:app_censo/components/rounded_input.dart';
import 'package:app_censo/components/rounded_password_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key key,
    @required this.isLogin,
    @required this.animationDuration,
    @required this.size,
    @required this.defaultLoginSize,
  }) : super(key: key);

  final bool isLogin;
  final Duration animationDuration;
  final Size size;
  final double defaultLoginSize;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isLogin ? 1.0 : 0.0,
      duration: animationDuration * 3,
      child: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Container(
            width: size.width,
            height: defaultLoginSize,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Inicio Sesión',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(height: 40),
                SvgPicture.asset('assets/images/login.png'),
                SizedBox(height: 40),
                RoundedInput(icon: Icons.mail, hint: 'Username'),
                RoundedPassswordInput(hint: 'Password'),
                SizedBox(height: 10),
                RoundedButton(title: 'LOGIN')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
