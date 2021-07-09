
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCard extends StatefulWidget {
  final double width;
  final double height;
  MyCard({required this.height, required this.width});

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> with SingleTickerProviderStateMixin {
  late AnimationController cardAnimationController;
  late Animation cardAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    cardAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    final animCurve = CurvedAnimation(
      parent: cardAnimationController,
      curve: Curves.linear,
    );
    cardAnimation = Tween<double>(
      begin: 0,
      end: -math.pi / 25,
    ).animate(animCurve)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          cardAnimationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          cardAnimationController.forward();
        }
      });

    cardAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return 
        AnimatedBuilder(
          animation: cardAnimation,
          builder: (BuildContext context, Widget? child) {
            return Transform.rotate(
              angle: cardAnimation.value,
              child: myCard(),
            );
          },
        
      
    );
  }

  Widget myCard() {
    return Transform.rotate(
      angle: 20 / 360,
      child: Stack(
        children: [
         
          Positioned(
            top: widget.height / 3,
            right: 30,
            child: Container(
              width: widget.width * 0.30,
              height: widget.height * 0.35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                    color: Colors.white.withOpacity(0.2), width: 1.0),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.5),
                    Colors.white.withOpacity(0.2),
                  ],
                  stops: [0.0, 0.1],
                ),
                // color: HexColor('#7D46E5').withOpacity(0.1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Cardy'.toUpperCase(),
                          style: GoogleFonts.jost(color: Colors.white),
                        ),
                        Spacer(),
                        Icon(
                          Icons.card_membership,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          '2345  2828  8798  8976',
                          style: GoogleFonts.jost(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Text(
                          'John Doe'.toUpperCase(),
                          style: GoogleFonts.jost(
                            color: Colors.white,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '12/24',
                          style: GoogleFonts.jost(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    cardAnimationController.dispose();
  }
}
