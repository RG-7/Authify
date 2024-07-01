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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            _avtarWidget(),
          ],
        ),
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
