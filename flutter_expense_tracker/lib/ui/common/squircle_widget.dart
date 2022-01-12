// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cupertino_rounded_corners/cupertino_rounded_corners.dart'; // For SquircleBorder

class SquircleWidget extends StatelessWidget {
  List<Color> colors;
  EdgeInsets margin;
  double shadowElevation;
  Widget child;
  EdgeInsets childPadding;

  SquircleWidget({
    this.colors = const [Colors.blue, Colors.purpleAccent, Colors.deepOrangeAccent],
    this.margin = const EdgeInsets.all(10.0),
    this.shadowElevation = 8.0,
    this.child = const SizedBox.shrink(),
    this.childPadding = const EdgeInsets.all(30.0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Material(
        color: Colors.transparent,
        shape: const SquircleBorder(
          radius: BorderRadius.all(
            Radius.elliptical(40.0, 40.0),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        elevation: shadowElevation,
        child: Container(
          padding: childPadding,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: colors,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}





// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:cupertino_rounded_corners/cupertino_rounded_corners.dart'; // For SquircleBorder

// class SquircleWidget extends StatelessWidget {
//   Color color;
//   EdgeInsets margin;
//   double shadowElevation;
//   Widget child;
//   EdgeInsets childPadding;

//   SquircleWidget({
//     this.color = Colors.white,
//     this.margin = const EdgeInsets.all(8.0),
//     this.shadowElevation = 8.0,
//     this.child = const SizedBox.shrink(),
//     this.childPadding = const EdgeInsets.all(30.0),
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.transparent,
//         borderRadius: BorderRadius.all(
//           Radius.circular(4.0),
//         ),
//       ),
//       margin: margin,
      
      
//       child: Material(
//         color: color,
//         shape: SquircleBorder(
//           radius: BorderRadius.all(
//             Radius.elliptical(
//               40.0,
//               40.0,
//             ),
//           ),
//         ),
//         elevation: shadowElevation,
//         child: Padding(padding: childPadding, child: child),
//       ),
//     );
//   }
// }




// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:cupertino_rounded_corners/cupertino_rounded_corners.dart'; // For SquircleBorder

// class SquircleWidget extends StatelessWidget {
//   Color color;
//   EdgeInsets margin;
//   double shadowElevation;
//   Widget child;
//   EdgeInsets childPadding;

//   SquircleWidget({
//     this.color = Colors.white,
//     this.margin = const EdgeInsets.all(8.0),
//     this.shadowElevation = 8.0,
//     this.child = const SizedBox.shrink(),
//     this.childPadding = const EdgeInsets.all(30.0),
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.transparent,
//         borderRadius: BorderRadius.all(
//           Radius.circular(4.0),
//         ),
//       ),
//       margin: EdgeInsets.all(20.0),
//       child: Material(
//         color: Colors.pink,
//         shape: SquircleBorder(
//           radius: BorderRadius.all(
//             Radius.elliptical(40.0, 40.0),
//           ),
//         ),
//         elevation: 8.0,
//         child: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.centerLeft,
//               end: Alignment.centerRight,
//               colors: [Colors.purple, Colors.blue],
//             ),
//           ),

//           child: Padding(
//             padding: EdgeInsets.all(30.0),
//             child: Text("This is an example."),
//           ),
//         ),
//       ),
//     );
//   }
// }