import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'models/user_model.dart';

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
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => ProfileScreen(userCredential: userCredential),
      //     ));
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

class ProfileScreen extends StatefulWidget {
  // final UserCredential? userCredential;
  ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController ageController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  final Stream<QuerySnapshot> usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();
  List<UserModel> userList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Screen'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            //   mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
                controller: nameController,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Age',
                ),
                controller: ageController,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                controller: emailController,
              ),
              SizedBox(height: 20),
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                runSpacing: 10,
                spacing: 16,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      addUser();
                    },
                    child: Text('Add'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      //    editUser();
                    },
                    child: Text('Update'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      //  addUser();
                      getUserData();
                    },
                    child: Text('Get all'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'User List',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                        '${userList[index].name} ID: ${userList[index].id}'),
                    trailing: IconButton(
                        onPressed: () {
                          deleteUser(userList[index].id ?? '');
                        },
                        icon: Icon(Icons.delete)),
                    subtitle: Text(
                        'Age: ${userList[index].age}, Email: ${userList[index].email}, Featured: ${userList[index].isFeatured}'),
                  );
                },
              ),
              Text(
                'User Stream List',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 600,
                child: StreamBuilder<QuerySnapshot>(
                  stream: usersStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading");
                    }

                    return ListView(
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        return ListTile(
                          title: Text('${data['name']} ID: ${document.id}'),
                          trailing: IconButton(
                              onPressed: () {
                                deleteUser(document.id);
                              },
                              icon: Icon(Icons.delete)),
                          subtitle: Text(
                              'Age: ${data['age']}, Email: ${data['email']}, Featured: ${data['isFeatured']}'),
                        );
                      }).toList(),
                    );
                  },
                ),
              ),

              // Text('Welcome,'),
              // Text(
              //     'displayName: ${widget.userCredential?.user?.displayName ?? 'User'}!'),
              // Text(
              //     'emailVerified: ${widget.userCredential?.user?.emailVerified ?? 'User'}!'),
              // Text('uid: ${widget.userCredential?.user?.uid ?? 'User'}!'),
              // SizedBox(height: 20),
              // ElevatedButton(
              //   onPressed: () async {
              //     await FirebaseAuth.instance.signOut();
              //     Navigator.pop(context);
              //   },
              //   child: Text('Logout'),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  getUserData() async {
    final snapshot = await users.get();
    userList.clear();
    for (var doc in snapshot.docs) {
      userList.add(UserModel(
        id: doc.id,
        name: doc['name'],
        age: doc['age'],
        isFeatured: doc['isFeatured'],
        //   email: doc['email'],
      ));
    }
    setState(() {});
  }

  Future<void> addUser() {
    return users
        .add({
          'name': nameController.text,
          'email': emailController.text,
          'age': int.tryParse(ageController.text) ?? 0,
          'isFeatured': ((int.tryParse(ageController.text) ?? 0) > 35)
        })
        .then((value) => log("User Added ${value.id}"))
        .catchError((error) => log("Failed to add user: $error"));
  }

  // Future<void> editUser() {
  //   return users
  //       .doc(widget.userCredential?.user?.uid)
  //       .update({
  //         'name': nameController.text,
  //         // 'email': emailController.text,
  //         // 'age': int.tryParse(ageController.text) ?? 0,
  //         // 'isFeatured': ((int.tryParse(ageController.text) ?? 0) > 35)
  //       })
  //       .then((value) => log("User updated"))
  //       .catchError((error) => log("Failed to update user: $error"));
  // }

  Future<void> deleteUser(String docId) {
    return users
        .doc(docId)
        .delete()
        .then((value) => log("User Deleted"))
        .catchError((error) => log("Failed to delete user: $error"));
  }
}
