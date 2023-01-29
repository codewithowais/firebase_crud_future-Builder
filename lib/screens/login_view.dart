import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseclass/screens/home_view.dart';
import 'package:firebaseclass/screens/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  TextEditingController email_control = TextEditingController();
  TextEditingController pass_control = TextEditingController();
  @override
  login(context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email_control.text,
        password: pass_control.text,
      );
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeView()));
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

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: email_control,
          ),
          TextField(
            controller: pass_control,
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignupView()));
              },
              child: Text("Did not have account Signup?")),
          ElevatedButton(
              onPressed: () {
                login(context);
              },
              child: Text("Login"))
        ],
      ),
    );
  }
}
