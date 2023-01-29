import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});
  TextEditingController semail_control = TextEditingController();
  TextEditingController spass_control = TextEditingController();
  signup(context) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: semail_control.text,
        password: spass_control.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: semail_control,
          ),
          TextField(
            controller: spass_control,
          ),
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text("back")),
          ElevatedButton(
              onPressed: () {
                signup(context);
              },
              child: Text("signup"))
        ],
      ),
    );
  }
}
