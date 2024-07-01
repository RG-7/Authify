// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  double? deviceHeight;
  double? deviceWidth;
  Color primaryColor = const Color.fromRGBO(125, 191, 211, 1.0);
  Color secondaryColor = const Color.fromRGBO(169, 224, 241, 1.0);

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: primaryColor,
      body: Align(
        alignment: Alignment.center,
        child: Container(
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
              _loginButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginButton() {
    return MaterialButton(
      onPressed: () {},
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
    return Container(
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
    );
  }
}
