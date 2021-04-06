import 'package:app_censo/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/cancel_button.dart';
import 'components/login_form.dart';
import 'components/register_form.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  bool isLogin = true;
  Animation<double> containerSize;
  AnimationController animationController;
  Duration animationDuration = Duration(milliseconds: 270);

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);

    animationController =
        AnimationController(vsync: this, duration: animationDuration);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double viewInset = MediaQuery.of(context)
        .viewInsets
        .bottom; //estamos usando esto para determinar que el teclado está abierto o no
    double defaultLoginSize = size.height - (size.height * 0.2);
    double defaultRegisterSize = size.height - (size.height * 0.1);

    containerSize = Tween<double>(
            begin: size.height * 0.1, end: defaultRegisterSize)
        .animate(
            CurvedAnimation(parent: animationController, curve: Curves.linear));

    return Scaffold(
      body: Stack(
        children: [
          //agreguemos algunas decoraciones
          Positioned(
              top: 100,
              right: -50,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: kPrimaryColor),
              )),

          Positioned(
              top: -50,
              left: -50,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: kPrimaryColor),
              )),

          //boton cancelar
          CancelButton(
            isLogin: isLogin,
            animationDuration: animationDuration,
            size: size,
            animationController: animationController,
            tapEvent: isLogin
                ? null
                : () {
                    //Volviendo nula para desactivar el botón
                    animationController.reverse();
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
          ),

          //login form
          LoginForm(
              isLogin: isLogin,
              animationDuration: animationDuration,
              size: size,
              defaultLoginSize: defaultLoginSize),

          //Contenedor de registros, Register Container
          AnimatedBuilder(
            animation: animationController,
            builder: (context, child) {
              if (viewInset == 0 && isLogin) {
                return buildRegisterContainer();
              } else if (!isLogin) {
                return buildRegisterContainer();
              }
              return Container();
            },
          ),

          //Register form

          RegisterForm(
              isLogin: isLogin,
              animationDuration: animationDuration,
              size: size,
              defaultLoginSize: defaultLoginSize),
        ],
      ),
    );
  }

  Widget buildRegisterContainer() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: containerSize.value,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(100),
              topRight: Radius.circular(100),
            ),
            color: kBackgroundColor),
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: !isLogin
              ? null
              : () {
                  animationController.forward();
                  setState(() {
                    isLogin = !isLogin;
                  });
                },
          child: isLogin
              ? Text(
                  "¿No tienes cuenta? Regístrate",
                  style: TextStyle(color: kPrimaryColor, fontSize: 18),
                )
              : null,
        ),
      ),
    );
  }
}
