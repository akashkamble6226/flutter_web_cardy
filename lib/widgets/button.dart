import 'package:cardy/widgets/text_Anim.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Button extends StatefulWidget {
  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> with TickerProviderStateMixin {
  late AnimationController buttonAnimationController;
  late Animation<double> buttonAnimation;

  @override
  void initState() {
    // button animation
    buttonAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    buttonAnimation =
        Tween<double>(begin: 0, end: -150.0).animate(buttonAnimationController);
    buttonAnimationController.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: deviceWidth,
        height: deviceHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                HexColor('#161616'),
                HexColor('#161616'),
                HexColor('#7D46E5'),
              ]),
        ),
        child: Stack(
          children: [
            
            BuildAnimText(deviceWidth: deviceWidth),
            Positioned(
              top: deviceHeight * 0.65,
              left: 0,
              child: Container(
                width: deviceWidth / 3,
                height: deviceHeight / 3,
                decoration: BoxDecoration(
                  color: HexColor('#161616'),
                ),
                child: buildDownloadButton(
                    deviceHeight, deviceWidth, buttonAnimation),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDownloadButton(deviceHeight, deviceWidth, buttonAnimation) {
  return Stack(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 35, top: 20),
        child: AnimatedBuilder(
          animation: buttonAnimation,
          builder: (BuildContext context, Widget? child) {
            return Transform.translate(
              offset: Offset(0, buttonAnimation.value),
              child: buildAnimateButton(deviceHeight),
            );
          },
        ),
      ),
      Align(
        alignment: Alignment(-0.9, 0.5),
        child: Container(
          width: deviceWidth / 3,
          height: deviceHeight / 5,
          decoration: BoxDecoration(
            color: HexColor('#161616'),
          ),
        ),
      ),
    ],
  );
}

Widget buildAnimateButton(deviceHeight) {
  return Align(
      alignment: Alignment(-0.9, 0.80),
      child: Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          // gradient: LinearGradient(begin: ,end:,colors: []),
          color: HexColor('#161616'),
          border: Border.all(
            color: HexColor('#7D46E5'),
            width: 3,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 3, bottom: 3),
            child: Text(
              'Download Now'.toUpperCase(),
              style: GoogleFonts.openSans(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
      ));
}


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    buttonAnimationController.dispose();
  }
}
