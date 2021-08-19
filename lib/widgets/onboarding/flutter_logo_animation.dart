import 'package:flutter/material.dart';

class AnimatedFlutterLogo extends StatefulWidget {
  @override
  _AnimatedFlutterLogoState createState() => _AnimatedFlutterLogoState();
}

class _AnimatedFlutterLogoState extends State<AnimatedFlutterLogo>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = _animationController.drive(Tween(begin: -1, end: 1));
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizeTransition(
        child: Container(
          height: 250,
          width: 300,
          child: FlutterLogo(),
        ),
        sizeFactor: _animation,
        axis: Axis.vertical,
      ),
    );
  }
}
