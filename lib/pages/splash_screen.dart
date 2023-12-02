import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ourmessenger/services/auth/auth_gate.dart';

//splash screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      //exit full-screen
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
          statusBarColor: Colors.white));

      Navigator
    .of(context)
    .pushReplacement( MaterialPageRoute(builder: (BuildContext context) => const AuthGate()));
;

    });
  }

  @override
  Widget build(BuildContext context) {
    //initializing media query (for getting device screen size)
    var mq = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 21, 21),
      //body
      body: Stack(children: [
        //app logo
        Positioned(
            top: mq.height * .30,
            right: mq.width * .25,
            width: mq.width * .5,
            child: Image.asset('images/icon.png')),

        //google login button
        // Positioned(
        //     bottom: mq.height * .15,
        //     width: mq.width,
        //     child: const Text('MADE IN INDIA WITH ❤️',
        //         textAlign: TextAlign.center,
        //         style: TextStyle(
        //             fontSize: 16, color: Colors.black87, letterSpacing: .5))),
      ]),
    );
  }
}
