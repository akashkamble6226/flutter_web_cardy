import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';

class TopMenuBar extends StatefulWidget {
  @override
  _TopMenuBarState createState() => _TopMenuBarState();
}

class _TopMenuBarState extends State<TopMenuBar>
    with SingleTickerProviderStateMixin {
  late AnimationController menuBarAnimationController;
  late Animation menuBarAnimation;

  @override
  void initState() {
    // TODO: implement initState

    menuBarAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    menuBarAnimation =
        Tween<double>(begin: 0, end: 100).animate(menuBarAnimationController);

      Future.delayed(Duration(seconds:1),(){
          menuBarAnimationController.forward();
      });

    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: menuBarAnimation,
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
            offset: Offset(0, menuBarAnimation.value),
            child:buildMenuBar() ,
          );
        },
        child: buildMenuBar());
  }

  Widget buildMenuBar() {
    return Align(
      alignment:FractionalOffset(-0.2,-0.2),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Container(
          child: Row(
            children: [
              Text(
                'Cardy'.toUpperCase(),
                style: GoogleFonts.jost(color: Colors.white, fontWeight: FontWeight.bold)
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  menuName('Transactions'),
                  SizedBox(width: 100),
                  menuName('Cards'),
                  SizedBox(width: 100),
                  menuName('Payments'),
                ],
              ),
              Spacer(),
              Container(
                width: 140,
                height: 40,
                decoration: BoxDecoration(
                    color: HexColor('#ffffff'),
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: Text(
                    'Get the app'.toUpperCase(),
                   style: GoogleFonts.jost(color: HexColor('#161616'), fontWeight: FontWeight.bold)
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget menuName(String name) {
    return Text(
      name.toUpperCase(),
      style: GoogleFonts.jost(color: Colors.white,)
    );
  }
}
