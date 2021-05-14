import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initStates
    super.initState();

    Timer(
      Duration(seconds: 4),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              width: 300,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/app_logo.png"),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SpinKitFadingCube(
              color: Colors.black54,
              size: 25.0,
              duration: Duration(milliseconds: 1000),
            ),
          ],
        ),
      ),
    );
    //   Stack(
    //
    //   children: [
    //
    //     Container(
    //         decoration: BoxDecoration(
    //           image: DecorationImage(
    //             fit: BoxFit.fill,
    //             image: AssetImage("assets/background.jpg"),
    //           ),
    //         ),
    //       ),
    //     Column(
    //       children: [
    //         Container(
    //           decoration: BoxDecoration(
    //             image: DecorationImage(
    //               fit: BoxFit.cover,
    //               image: AssetImage("assets/app_logo.png"),
    //             ),
    //           ),
    //         ),
    //         CircularProgressIndicator(),
    //       ],
    //     ),
    //
    //   ],
    //
    // );
  }
}
