import 'package:cardy/widgets/BigCircleAnimation.dart';
import 'package:cardy/widgets/card.dart';
import 'package:cardy/widgets/circleAnim.dart';

import 'package:cardy/widgets/top_Menu_Bar.dart';
import 'package:cardy/widgets/towords_Right.dart';
import 'package:hexcolor/hexcolor.dart';

import '../widgets/build_Outlined_Circle.dart';
import 'package:flutter/material.dart';

import '../widgets/button.dart';

class HomePage extends StatelessWidget {
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
            //Animated text and button
            Button(),
            // menu bar
            TopMenuBar(),
            // top Left circle
            buildOutlinedCircleTop(-80, -80, 250, 250, true),
            buildOutlinedCircleTop(-60, -60, 180, 180, true),
            // for bottom right
            buildOutlinedCircleBottom(-80, -80, 250, 250, false),
            buildOutlinedCircleBottom(-60, -60, 180, 180, false),
            TowerdsRight(),
            CircleAnimation(
              deviceWidth: deviceWidth,
              deviceHeight: deviceHeight,
            ),

            BigCircleAnimation(
              deviceHeight: deviceHeight,
              deviceWidth: deviceWidth,
            ),

            MyCard(height: deviceHeight, width: deviceWidth),
          ],
        ),
      ),
    );
  }
}
