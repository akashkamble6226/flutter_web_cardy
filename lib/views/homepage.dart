import 'package:cardy/widgets/card.dart';

import '../widgets/build_Outlined_Circle.dart';
import '../widgets/top_Menu_Bar.dart';

import '../widgets/button_Anim.dart';

import '../widgets/text_Anim.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController textAnimationController;
  late Animation<double> animation;

  late AnimationController buttonAnimationController;
  late Animation<double> buttonAnimation;

  @override
  void initState() {
    // text animation
    textAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    animation =
        Tween<double>(begin: 0, end: -200).animate(textAnimationController);
    textAnimationController.forward();

    buttonAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    buttonAnimation =
        Tween<double>(begin: 0, end: -150).animate(buttonAnimationController);

    buttonAnimationController.forward();

    // button animation

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
            //for top left
            

           
           
            MyCard(height: deviceHeight, width: deviceWidth),
            TopMenuBar(),
            buildOutlinedCircleTop(-80, -80, 250, 250, true),
            buildOutlinedCircleTop(-60, -60, 180, 180, true),

           

            
              // for bottom right
            buildOutlinedCircleBottom(-80, -80, 250, 250, false),
            buildOutlinedCircleBottom(-60, -60, 180, 180, false),
            BuildAnimText(animation: animation, deviceWidth: deviceWidth),
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

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textAnimationController.dispose();
    buttonAnimationController.dispose();
  }
}
