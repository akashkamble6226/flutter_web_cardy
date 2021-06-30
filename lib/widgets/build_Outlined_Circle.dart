import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget buildOutlinedCircleTop(double top, double left, double height, double width, bool isOpacity) {
    return Positioned(
      top: top,
      left: left,
      child: Opacity(
        opacity:isOpacity ? 0.5 :1.0,
              child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              // color: HexColor('#7D46E5'),
              border: Border.all(
                color: HexColor('#7D46E5'),
              )),
        ),
      ),
    );
  }


Widget buildOutlinedCircleBottom(double bottom, double right, double height, double width, bool isOpacity) {
    return Positioned(
      bottom: bottom,
      right: right,
      child: Opacity(
        opacity:isOpacity ? 0.5 :1.0,
              child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              // color: HexColor('#7D46E5'),
              border: Border.all(
                color: HexColor('#7D46E5'),
              )),
        ),
      ),
    );
  }