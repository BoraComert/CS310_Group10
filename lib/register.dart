import 'package:flutter/material.dart';
import 'package:flutter_demo/terms_policy.dart';
import 'package:flutter_demo/utils.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SuConnect",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Create an account",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
            ),
            Text(
              "Sign up with your Sabanci Email",
              style: TextStyle(fontSize: 18),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'email@sabanciuniv.edu',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: TextField(
                obscureText: true,

                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password Again',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                minimumSize: Size(345, 60),
                backgroundColor: Colors.black,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
              child: Text("Sign Up", style: TextStyle(color: Colors.white)),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Utilities.buildText(
                label: "By clicking continue, you agree to our",
                size: 15,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TermsPolicy()),
                );
              },

              style: TextButton.styleFrom(
                minimumSize: Size(30, 20),
                backgroundColor: Colors.white10,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
              child: Utilities.buildText(
                label: "Terms & Privacy Policy",
                size: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
