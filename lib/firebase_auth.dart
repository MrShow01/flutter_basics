import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthScreen extends StatefulWidget {
  const FirebaseAuthScreen({super.key});

  @override
  State<FirebaseAuthScreen> createState() => _FirebaseAuthScreenState();
}

class _FirebaseAuthScreenState extends State<FirebaseAuthScreen> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  login() async {
    if (emailTextController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Please enter email')));
      return;
    }
    if (passwordTextController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Please enter password')));
      return;
    }
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailTextController.text,
              password: passwordTextController.text);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${userCredential.user?.email} Logged in successfully'),
      ));
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileScreen(userCredential: userCredential),
          ));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Auth Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 16,
          children: [
            SizedBox(
              height: 50,
            ),
            Center(
              child: Text('Firebase Auth Screen'),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              controller: emailTextController,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
              controller: passwordTextController,
            ),
            ElevatedButton(
              onPressed: () {
                login();
              },
              style: ButtonStyle(
                  textStyle: WidgetStateProperty.all(
                      TextStyle(color: Colors.white, fontSize: 20)),
                  backgroundColor: WidgetStateProperty.all(Colors.blue)),
              child: Text('Login',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account?'),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FirebaseRegister()),
                      );
                    },
                    child: Text('Sign Up'))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class FirebaseRegister extends StatefulWidget {
  const FirebaseRegister({super.key});

  @override
  State<FirebaseRegister> createState() => _FirebaseRegisterState();
}

class _FirebaseRegisterState extends State<FirebaseRegister> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();
  register() async {
    if (emailTextController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Please enter email')));
      return;
    }
    if (passwordTextController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Please enter password')));
      return;
    }
    if (confirmPasswordTextController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please enter confirm password')));
      return;
    }
    if (passwordTextController.text != confirmPasswordTextController.text) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Password and confirm password do not match')));
      return;
    }
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailTextController.text,
        password: passwordTextController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:
              Text('User ${credential.user?.email} registered successfully')));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('The account already exists for that email.')));
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Register Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 16,
          children: [
            SizedBox(
              height: 50,
            ),
            Center(
              child: Text('Firebase Register Screen'),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              controller: emailTextController,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
              controller: passwordTextController,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Confirm Password',
              ),
              obscureText: true,
              controller: confirmPasswordTextController,
            ),
            ElevatedButton(
              onPressed: () {
                register();
              },
              style: ButtonStyle(
                  textStyle: WidgetStateProperty.all(
                      TextStyle(color: Colors.white, fontSize: 20)),
                  backgroundColor: WidgetStateProperty.all(Colors.blue)),
              child: Text('Register',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Have an account?'),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Login'))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final UserCredential? userCredential;
  const ProfileScreen({super.key, required this.userCredential});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, ${userCredential?.user?.email ?? 'User'}!'),
            Text(
                'displayName: ${userCredential?.user?.displayName ?? 'User'}!'),
            Text(
                'emailVerified: ${userCredential?.user?.emailVerified ?? 'User'}!'),
            Text('uid: ${userCredential?.user?.uid ?? 'User'}!'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pop(context);
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
