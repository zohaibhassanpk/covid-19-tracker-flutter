import 'dart:async';

import 'package:covid_19_tracker/view/world_state.dart';
import 'package:flutter/material.dart';
import 'dart:math'as math;

class PracticeFlash extends StatefulWidget {
  const PracticeFlash({super.key});

  @override
  State<PracticeFlash> createState() => _PracticeFlashState();
}

class _PracticeFlashState extends State<PracticeFlash> with TickerProviderStateMixin {
  late final AnimationController controller =AnimationController(
  duration: Duration(seconds: 3),
      vsync: this)..repeat();
  @override
  void dispose(){
    super.dispose();
    controller.dispose();
  }
  void initState(){
    super.initState();
    Timer(Duration(seconds: 5),
    () => Navigator.push(context, MaterialPageRoute(builder: (context) => WorldState(),)),);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedBuilder(animation: controller,
               child: Align(
                 alignment: Alignment.center,
                 child: Container(
                   height: MediaQuery.of(context).size.height*.3,
                   width: MediaQuery.of(context).size.width*0.5,
                   child: Center(child: Image(image: AssetImage('assets/virus.png'))),
                 ),
               ),
               builder: (BuildContext context, Widget? child){
            return Transform.rotate(angle: controller.value*2.0*math.pi,
            child: child,);

          }
          )
        ],
      ) ,
    );
  }
}
