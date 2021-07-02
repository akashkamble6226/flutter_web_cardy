import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

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
