import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  double? deviceHeight;
  double? deviceWidth;

  Color secondaryColor = const Color.fromRGBO(125, 191, 211, 1.0);
  Color primaryColor = const Color.fromRGBO(169, 224, 241, 1.0);
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: deviceWidth,
          height: deviceHeight! * 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              _avtarWidget(),
              SizedBox(
                height: deviceHeight! * 0.03,
              ),
              _nameWidget(),
              SizedBox(
                height: deviceHeight! * 0.2,
              ),
              _logOutButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _logOutButton(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      minWidth: deviceWidth! * 0.38,
      height: deviceHeight! * 0.055,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
        side: BorderSide(
          color: primaryColor,
          width: 3,
        ),
      ),
      child: Text(
        'LOG OUT',
        style: TextStyle(
            color: primaryColor, fontSize: 18, fontWeight: FontWeight.w900),
      ),
    );
  }

  Widget _nameWidget() {
    return SizedBox(
      child: Text(
        'Ratn Govindam',
        style: TextStyle(
          color: primaryColor,
          fontSize: 35,
          fontWeight: FontWeight.w400,
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
