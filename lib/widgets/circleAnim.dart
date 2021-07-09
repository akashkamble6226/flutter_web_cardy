import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CircleAnimation extends StatefulWidget {
  final double deviceWidth;
  final double deviceHeight;

  CircleAnimation({
    required this.deviceWidth,
    required this.deviceHeight,
  });

  @override
  _CircleAnimationState createState() => _CircleAnimationState();
}

class _CircleAnimationState extends State<CircleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController smallCircleAnimationController;
  late Animation smallCircleAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // small circle animation
    smallCircleAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    // smallCircleAnimation =
    //     Tween(begin: 0, end: -100.5).animate(smallCircleAnimationController);

    final animCurve = CurvedAnimation(
      parent: smallCircleAnimationController,
      curve: Curves.linear,
    );
    smallCircleAnimation = Tween<double>(
      begin: 0,
      end: -100.5,
    ).animate(animCurve)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          smallCircleAnimationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          smallCircleAnimationController.forward();
        }
      });
    smallCircleAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return 
    
    Positioned(
      top: widget.deviceHeight / 1.5,
      right: 400,
      child: 
      AnimatedBuilder(
        animation: smallCircleAnimation,
        builder: (BuildContext ctx, Widget? child) {
          return Transform.translate(
            offset: Offset(0, smallCircleAnimation.value),
            child: buildSmallCircle(),
          );
        },
      ),
    );
  }

  Widget buildSmallCircle() {
    return  Container(
         width:100,
         height: 100,
          decoration: BoxDecoration(
            color: HexColor('#7D46E5').withOpacity(0.5),
            borderRadius: BorderRadius.all(Radius.circular(100)) 
          ),
  
      
    );
  }
}
