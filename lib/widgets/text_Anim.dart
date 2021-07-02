 import 'package:flutter/material.dart';
 import 'package:google_fonts/google_fonts.dart';
 
class BuildAnimText extends StatelessWidget {
  const BuildAnimText({
    Key? key,
    required this.animation,
    required this.deviceWidth,
  }) : super(key: key);

  final Animation<double> animation;
  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
    offset: Offset(0, animation.value),
    child: animChild(deviceWidth),
        );
      },
    );
  }
}

Widget animChild(deviceWidth) {
  return Align(
    alignment: Alignment(-0.9, 0.8),
    child: Container(
      width: deviceWidth / 3,
      child: Text(
        'MAKE YOUR FINANCE GOALS SMARTER',

        style:GoogleFonts.openSans
(fontWeight: FontWeight.bold,color:Colors.white,fontSize: 50),
           
      ),
    ),
  );
}