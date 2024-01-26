import 'package:flutter/material.dart';

class Anim2Screen extends StatefulWidget {
  @override
  _Anim2ScreenState createState() => _Anim2ScreenState();
}

class _Anim2ScreenState extends State<Anim2Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animation;

  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Text('Welcome Galaxy',style: TextStyle(color: Colors.white,fontSize: 24),),
          AnimatedBuilder(
            animation: _animation,
            builder: (_, __) {
              return ClipPath(
                clipper: const BeamClipper(),
                child: Container(
                  height: 1000,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      radius: 1.5,
                      colors: [
                        Colors.yellow,
                        Colors.transparent,
                      ],
                      stops: [0, _animation.value],
                    ),
                  ),
                ),
              );
            },
          ),

        ],
      ),
    );
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }
}

class BeamClipper extends CustomClipper<Path> {
  const BeamClipper();

  @override
  getClip(Size size) {
    return Path()
      ..lineTo(size.width / 2, size.height / 2)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(size.width / 2, size.height / 2)
      ..close();
  }

  /// Return false always because we always clip the same area.
  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}