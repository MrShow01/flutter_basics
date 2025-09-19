// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseLogin extends StatelessWidget {
  FirebaseLogin({super.key});
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  login(BuildContext context) async {
    final validate = formKey.currentState?.validate();
    if (validate == false) {
      return;
    }
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
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailTextController.text,
        password: passwordTextController.text,
      );
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProfileAuthScreen(
                    userCredential: credential,
                  )));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('No user found for that email.')));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Wrong password provided for that user.')));
      }
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message.toString())));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            children: [
              SizedBox(
                height: 50,
              ),
              Center(
                child: Text('Firebase Login Screen'),
              ),
              Form(
                key: formKey,
                child: Column(
                  spacing: 16,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Email', border: InputBorder.none),
                        validator: (value) =>
                            value != null && !value.contains('@')
                                ? 'Enter a valid email'
                                : null,
                        keyboardType: TextInputType.emailAddress,
                        controller: emailTextController,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Password', border: InputBorder.none),
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) => value != null && value.length < 8
                            ? 'Enter min. 8 characters'
                            : null,
                        controller: passwordTextController,
                        obscureText: true,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        login(context);
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.blue),
                      ),
                      child: Text('Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
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
                                builder: (context) => FireBaseSignUp()));
                      },
                      child: Text('Register'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FireBaseSignUp extends StatelessWidget {
  FireBaseSignUp({super.key});
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Register Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            children: [
              SizedBox(
                height: 50,
              ),
              Center(
                child: Text('Firebase Register Screen'),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Email', border: InputBorder.none),
                  keyboardType: TextInputType.emailAddress,
                  controller: emailTextController,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Password', border: InputBorder.none),
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordTextController,
                  obscureText: true,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Confirm Password', border: InputBorder.none),
                  keyboardType: TextInputType.visiblePassword,
                  controller: confirmPasswordTextController,
                  obscureText: true,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        register(context);
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.blue),
                      ),
                      child: Text('Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
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
      ),
    );
  }

  register(BuildContext context) async {
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
          content: Text('Password and Confirm Password do not match')));
      return;
    }
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailTextController.text,
        password: passwordTextController.text,
      );
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProfileAuthScreen(
                    userCredential: credential,
                  )));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('The password provided is too weak.')));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('The account already exists for that email.')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}

class ProfileAuthScreen extends StatelessWidget {
  final UserCredential? userCredential;
  const ProfileAuthScreen({super.key, required this.userCredential});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Screen'),
      ),
      body: Center(
        child: Column(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, ${userCredential?.user?.email ?? 'User'}!'),
            Text(
                'displayName: ${userCredential?.user?.displayName ?? 'User'}!'),
            Text(
                'isAnonymous: ${userCredential?.user?.isAnonymous ?? 'User'}!'),
            Text(
                'refreshToken: ${userCredential?.user?.refreshToken ?? 'User'}!'),
            Text(
                'emailVerified: ${userCredential?.user?.emailVerified ?? 'User'}!'),
            Text('uid: ${userCredential?.user?.uid ?? 'User'}!'),
            Text(
                'accessToken: ${userCredential?.credential?.accessToken ?? 'User'}!'),
            Text(
                'signInMethod: ${userCredential?.credential?.signInMethod ?? 'User'}!'),
            Text('token: ${userCredential?.credential?.token ?? 'User'}!'),
            Text(
                'providerId: ${userCredential?.credential?.providerId ?? 'User'}!'),
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
