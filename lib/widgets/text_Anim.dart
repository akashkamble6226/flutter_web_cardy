import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildAnimText extends StatefulWidget {

final double deviceWidth;
  BuildAnimText({
   required this.deviceWidth,
  });
  

  @override
  _BuildAnimTextState createState() => _BuildAnimTextState();
}

class _BuildAnimTextState extends State<BuildAnimText> with SingleTickerProviderStateMixin{
  
late AnimationController textAnimationController;
  late Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // text animation
    textAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    animation =
        Tween<double>(begin: 0, end: -200.0).animate(textAnimationController);
    textAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(0, animation.value),
          child: animChild(widget.deviceWidth),
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

/*




      RichText(
        text: TextSpan(
            style: GoogleFonts.openSans(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 50),
            children: [
              TextSpan(text: 'MAKE YOUR'),
              TextSpan(text: '              FINANCE GOALS'),
              TextSpan(text: '           SMARTER'),
            ]),
      ),
 */
