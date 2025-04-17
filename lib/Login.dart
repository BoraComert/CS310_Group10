import 'package:flutter/material.dart';
import 'package:flutter_demo/Create_Event_Screen.dart';
import 'package:flutter_demo/terms_policy.dart';
import 'package:flutter_demo/utils.dart';
import 'main_screen.dart';

class LoginClass extends StatefulWidget {
  const LoginClass({super.key});

  @override
  State<LoginClass> createState() => _LoginClassState();
}

class _LoginClassState extends State<LoginClass> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool email_checker(String entered_email) {
    return entered_email.endsWith('@sabanciuniv.edu');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utilities.appBar("SuConnect", Colors.white),
      body: Builder(
        builder: (context) => Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome Back",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                ),
                Text(
                  "Log in with your Sabanci Email",
                  style: TextStyle(fontSize: 18),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'email@sabanciuniv.edu',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                TextButton(
                  onPressed: () {
                    String email_user = emailController.text.trim();
                    String password_user = passwordController.text;

                    if (!email_checker(email_user) && password_user.isNotEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Please use your Sabanci email address."),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    if (!email_checker(email_user) && password_user.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Password cannot be empty."),
                          backgroundColor: Colors.orange,
                        ),
                      );
                      return;
                    }

                    // Login successful
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EventListScreen()),
                    );
                  },
                  style: TextButton.styleFrom(
                    minimumSize: Size(345, 60),
                    backgroundColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                  child: Text("Log In", style: TextStyle(color: Colors.white)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Text(
                    "Forgot your password?",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // reset logic buraya yazılabilir
                  },
                  style: TextButton.styleFrom(
                    minimumSize: Size(30, 20),
                    backgroundColor: Colors.white10,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                  child: Text(
                    "Reset Password",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
