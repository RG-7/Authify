// ignore_for_file: must_be_immutable

import 'package:authify/pages/home_page.dart';
import 'package:authify/utils/animations/login_page_animation.dart';
import 'package:authify/utils/routes/fade_page_routes.dart';
import 'package:flutter/material.dart';

class AnimatedLoginPage extends StatefulWidget {
  const AnimatedLoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AnimatedLoginPageState();
  }
}

class _AnimatedLoginPageState extends State<AnimatedLoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      reverseDuration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _LoginPage(_controller);
  }
}

class _LoginPage extends StatelessWidget {
  double? deviceHeight;
  double? deviceWidth;
  Color primaryColor = const Color.fromRGBO(125, 191, 211, 1.0);
  Color secondaryColor = const Color.fromRGBO(169, 224, 241, 1.0);

  EnterAnimation? _animation;
  _LoginPage(controller) {
    controller = controller;
    _animation = EnterAnimation(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: primaryColor,
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: deviceHeight,
          height: deviceHeight! * 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              _avtarWidget(),
              SizedBox(
                height: deviceHeight! * 0.05,
              ),
              _emailTextfield(),
              _passwordTextField(),
              SizedBox(
                height: deviceHeight! * 0.1,
              ),
              _loginButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.pushReplacement(
          context,
          FadePageRoute(HomePage()),
        );
      },
      minWidth: deviceWidth! * 0.38,
      height: deviceHeight! * 0.055,
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: const BorderSide(color: Colors.white)),
      child: Text(
        'LOG IN',
        style: TextStyle(
            color: primaryColor, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _passwordTextField() {
    return SizedBox(
      width: deviceWidth! * 0.7,
      child: const TextField(
        obscureText: true,
        autocorrect: false,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintText: "Password",
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _emailTextfield() {
    return SizedBox(
      width: deviceWidth! * 0.7,
      child: const TextField(
        autocorrect: false,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintText: "Ratn@gmail.com",
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _avtarWidget() {
    double circleD = deviceHeight! * 0.25;
    return AnimatedBuilder(
        animation: _animation!.controller,
        builder: (context, widget) {
          return Transform(
            transform: Matrix4.diagonal3Values(_animation!.circleSize!.value,
                _animation!.circleSize!.value, 1),
            alignment: Alignment.center,
            child: Container(
              height: circleD,
              width: circleD,
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(500),
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/images/main_avatar.png',
                  ),
                ),
              ),
            ),
          );
        });
  }
}
