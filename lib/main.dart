import 'dart:ui';

import 'package:anim_lesson/anim2_screen.dart';
import 'package:anim_lesson/dvd.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: BouncingDVD(),
    );
  }
}
//
// class AnimationScreen extends StatefulWidget{
//   @override
//   _AnimationScreenState createState() => _AnimationScreenState();
// }
//
// class _AnimationScreenState extends State<AnimationScreen> with SingleTickerProviderStateMixin{
//
//   late AnimationController _animationController;
//    double currentValue =0;
//   late Animation<double> curveAnimation;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     _animationController = AnimationController(
//         duration: Duration(seconds: 4),
//         vsync: this
//     );
//
//     curveAnimation = CurvedAnimation(parent: _animationController, curve: Curves.bounceIn);
//
//     _animationController.addListener((){
//       setState(() {
//         currentValue = _animationController.value;
//       });
//     });
//
//     _animationController.repeat();
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:Center(
//           child: /*Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text("$currentValue", style: TextStyle(fontSize: 30),),
//               SizedBox(height: 60,),
//               RotationTransition(
//                 child: Container(
//                   width: 200,
//                   height: 200,
//                   decoration: BoxDecoration(
//                     color: Colors.blue,
//                     shape: BoxShape.circle,
//                       boxShadow: [
//                     BoxShadow(
//                     color: Colors.grey,
//                     blurRadius: 15.0, // soften the shadow
//                     spreadRadius: 5.0, //extend the shadow
//                     offset: Offset(
//                       5.0, // Move to right 5  horizontally
//                       5.0, // Move to bottom 5 Vertically
//                     ),
//                     )
//                       ] ,
//                       gradient:LinearGradient(
//                         begin: Alignment.topRight,
//                         end: Alignment.bottomLeft,
//                         stops: [
//                           0.1,
//                           0.4,
//                           0.6,
//                           0.9,
//                         ],
//                         colors: [
//                           Colors.yellow,
//                           Colors.red,
//                           Colors.indigo,
//                           Colors.teal,
//                         ],
//                       )
//                   ),
//
//                 ),
//                 alignment: Alignment.center,
//                 turns: Tween<double>(begin: 0, end: 1).animate(curveAnimation),
//               ),
//             ],
//           )*/
//
//             Stack(
//         children: <Widget>[
//           PositionedTransition(
//             child: Container(
//               width: 100,
//               height: 100,
//               decoration: BoxDecoration(
//                 color: Colors.red,
//                 shape: BoxShape.circle
//               ),
//             ),
//             rect: RelativeRectTween(begin: RelativeRect.fromLTRB(0, 0, 0, 700),
//                 end: RelativeRect.fromLTRB(0, 700, 0, 0),).animate(curveAnimation),
//           )
//
//         ],
//       ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.book),
//         onPressed: (){
//           if(_animationController.isAnimating){
//             _animationController.stop();
//           }else{
//             _animationController.repeat();
//           }
//         },
//       ),
//
//     );
//   }
// }