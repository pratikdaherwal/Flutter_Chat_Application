import 'package:flutter/material.dart';
import 'package:ourmessenger/components/button.dart';
import 'package:ourmessenger/components/text_field.dart';
import 'package:ourmessenger/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  

  void logIn() async {
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signInWithEmailAndPassword(
          emailController.text, 
          passController.text,
          );
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 21, 21),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              // const SizedBox(height: 100),
              //logo
              const Icon(
                Icons.message,
                size: 80,
                color: Colors.white,
              ),

              const SizedBox(height: 50),
              //welcome back
              const Text(
                "Welcome Back!",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),

              //signin
              //email textfield
              const SizedBox(height: 10),
              MyTextField(
                  controller: emailController,
                  obscureText: false,
                  hintText: "Email"),

              //password textfield
              const SizedBox(height: 10),
              MyTextField(
                  controller: passController,
                  obscureText: true,
                  hintText: "Password"),
              const SizedBox(height: 30),
              MyButton(onTap: logIn, text: "Log In"),

              const SizedBox(height: 50),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Not a Member?",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      "Register Now",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  )
                ],
              )

              //register
            ]),
          ),
        ),
      ),
    );
  }
}
