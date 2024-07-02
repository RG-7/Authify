import 'package:authify/pages/login_page.dart';
import 'package:authify/utils/animations/login_page_animation.dart';
import 'package:authify/utils/routes/slide_page_routes.dart';
import 'package:flutter/material.dart';

class AnimatedHomePage extends StatefulWidget {
  const AnimatedHomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AnimatedHomePageState();
  }
}

class _AnimatedHomePageState extends State<AnimatedHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
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
    return _HomePage(_controller!);
  }
}

class _HomePage extends StatelessWidget {
  double? deviceHeight;
  double? deviceWidth;
  Color primaryColor = const Color.fromRGBO(169, 224, 241, 1.0);

  AnimationController _controller;
  EnterAnimation? _animation;
  _HomePage(this._controller) {
    _animation = EnterAnimation(_controller);
    _controller.forward();
  }

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
      onPressed: () {
        Navigator.push(context, SlidePageRoute(const AnimatedLoginPage()));
      },
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
    return AnimatedBuilder(
        animation: _animation!.controller,
        builder: (context, widget) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.diagonal3Values(_animation!.circleSize!.value,
                _animation!.circleSize!.value, 1),
            child: Container(
              height: circleD,
              width: circleD,
              decoration: BoxDecoration(
                color: primaryColor,
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
