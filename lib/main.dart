import 'package:flutter/material.dart';
import 'package:ourmessenger/firebase_options.dart';
import 'package:ourmessenger/services/auth/auth_gate.dart';
// import 'package:ourmessenger/services/auth/Login_Or_Register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ourmessenger/services/auth/auth_service.dart';
import 'package:provider/provider.dart';
// import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  
  runApp(
    ChangeNotifierProvider(
    create: (context) => AuthService(),
    child: const MyApp()
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Our Messenger',
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
    );
  }
}
