
import 'package:flutter/material.dart';

class SlidePageRoute extends PageRouteBuilder {
  final Widget _child;
  SlidePageRoute(this._child)
      : super(
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondAnimation,
              Widget child) {
            Animation<Offset> custom =
                Tween(begin: const Offset(-1, 0), end: const Offset(0, 0))
                    .animate(animation);
            return SlideTransition(
              position: custom,
              child: child,
            );
          },
          pageBuilder: (BuildContext context, animation, secondAnimation) {
            return _child;
          },
        );
}
