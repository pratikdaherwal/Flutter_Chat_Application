import 'package:flutter/material.dart';
import 'package:ourmessenger/components/button.dart';
import 'package:ourmessenger/components/text_field.dart';
import 'package:ourmessenger/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class RegistrationPage extends StatefulWidget {
  final void Function()? onTap;
  const RegistrationPage({super.key, required this.onTap});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

  void signUp() async {
    if (passController.text != confirmPassController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password not match!"),
        ),
      );
      return;
    }
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signUpWithEmailAndPassword(
          emailController.text, passController.text, nameController.text);
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
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
                "Let's Create Your Account",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),

              //signin
              //email textfield
              const SizedBox(height: 10),
              MyTextField(
                  controller: nameController,
                  obscureText: false,
                  hintText: "Name"),
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
              const SizedBox(height: 10),

              //confirm password textfield
              MyTextField(
                  controller: confirmPassController,
                  obscureText: true,
                  hintText: "Confirm Password"),
              const SizedBox(height: 30),

              //Signup button
              MyButton(onTap: signUp, text: "Sign Up"),

              const SizedBox(height: 50),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already a Member?",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      "Login Now",
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
