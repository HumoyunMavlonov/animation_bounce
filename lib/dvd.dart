import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class BouncingDVD extends StatefulWidget {
  const BouncingDVD({Key? key}) : super(key: key);

  @override
  State<BouncingDVD> createState() => _BouncingDVDState();
}

class _BouncingDVDState extends State<BouncingDVD> {
  Random random = Random();
  Color sharpColor = Colors.pink;
  double sharpWidth = 80, sharpHeight = 80;
  double x = 90, y = 30, xSpeed = 30, ySpeed = 30, speed = 100;

  pickColor() {
    Timer(const Duration(milliseconds: 100), () {
      int r = random.nextInt(255);
      int g = random.nextInt(255);
      int b = random.nextInt(255);
      sharpColor = Color.fromRGBO(r, g, b, 1);
    });
  }

  @override
  initState() {
    super.initState();
    update();
  }

  update() {
    Timer.periodic(Duration(milliseconds: speed.toInt()), (timer) {
      double screenWidth = MediaQuery.of(context).size.width;
      double screenHeight = MediaQuery.of(context).size.height;
      x += xSpeed;
      y += ySpeed;

      if (x + sharpWidth >= screenWidth) {
        xSpeed = -xSpeed;
        x = screenWidth - sharpWidth;
        pickColor();
      } else if (x <= 0) {
        xSpeed = -xSpeed;
        x = 0;
        pickColor();
      }

      if (y + sharpHeight >= screenHeight) {
        ySpeed = -ySpeed;
        y = screenHeight - sharpHeight;
        pickColor();
      } else if (y <= 0) {
        ySpeed = -ySpeed;
        y = 0;
        pickColor();
      }

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: speed.toInt()),
            left: x,
            top: y,
            child: Container(
              // color: sharpColor,
              height: sharpHeight,
              width: sharpWidth,
              decoration: BoxDecoration(
                color: sharpColor,
                shape: BoxShape.circle
              ),
            ),
          ),
        ],
      ),
    );
  }
}