import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TowerdsRight extends StatefulWidget {
  @override
  _TowerdsRightState createState() => _TowerdsRightState();
}

class _TowerdsRightState extends State<TowerdsRight>
    with SingleTickerProviderStateMixin {
  late AnimationController towerdsRightAnimationController;
  late Animation<Offset> towerdsRightAnimation;

  @override
  void initState() {
    // TODO: implement initState

    towerdsRightAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));

    towerdsRightAnimation =
        Tween<Offset>(begin: Offset(0.0, 0.0), end:  Offset(0.5 , 0.0))
            .animate(towerdsRightAnimationController);

    towerdsRightAnimation.addListener(() {
      setState(() {});
    });

    towerdsRightAnimationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: towerdsRightAnimation,
      child: buildMenuBar(),
    );
  }

  Widget buildMenuBar() {
    return Align(
      // alignment: FractionalOffset(-0.2, -0.2),
      alignment: FractionalOffset(0.9, 0.3),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            color: HexColor('#7D46E5').withOpacity(0.5),
            borderRadius: BorderRadius.all(Radius.circular(100))),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    towerdsRightAnimationController.dispose();
  }
}
