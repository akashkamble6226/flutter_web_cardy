import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class BigCircleAnimation extends StatefulWidget {
  final double deviceWidth;
  final double deviceHeight;

  BigCircleAnimation({
    required this.deviceWidth,
    required this.deviceHeight,
  });

  @override
  _BigCircleAnimationState createState() => _BigCircleAnimationState();
}

class _BigCircleAnimationState extends State<BigCircleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController bigCircleAnimationController;
  late Animation bigCircleAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // small circle animation
    bigCircleAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    // smallCircleAnimation =
    //     Tween(begin: 0, end: -100.5).animate(smallCircleAnimationController);

    final animCurve = CurvedAnimation(
      parent: bigCircleAnimationController,
      curve: Curves.linear,
    );
    bigCircleAnimation = Tween<double>(
      begin: 0,
      end: 100.5,
    ).animate(animCurve)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          bigCircleAnimationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          bigCircleAnimationController.forward();
        }
      });
    bigCircleAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return 
    
    Positioned(
      top: widget.deviceHeight /3.5,
      right:80,
      child:
      AnimatedBuilder(
        animation: bigCircleAnimation,
        builder: (BuildContext ctx, Widget? child) {
          return Transform.translate(
            offset: Offset(0, bigCircleAnimation.value),
            child:  buildBigCircle(),
          );
        },
      ),
    );
  }

  Widget buildBigCircle() {
    return Container(
      
        width:300,
        height: 300,
        decoration: BoxDecoration(
          color: HexColor('#7D46E5').withOpacity(0.5),
          borderRadius: BorderRadius.all(Radius.circular(300)) 
        ),
  
    );
  }
}
