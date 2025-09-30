// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'models/user_model.dart';
import 'notification_service.dart';

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
                  //     userCredential: credential,
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
                  //    userCredential: credential,
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

class ProfileAuthScreen extends StatefulWidget {
  //final UserCredential? userCredential;
  ProfileAuthScreen({
    super.key,
  });

  @override
  State<ProfileAuthScreen> createState() => _ProfileAuthScreenState();
}

class _ProfileAuthScreenState extends State<ProfileAuthScreen> {
  // Create a CollectionReference called users that references the firestore collection
  TextEditingController nameTextController = TextEditingController();

  TextEditingController ageTextController = TextEditingController();

  TextEditingController gradeTextController = TextEditingController();

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  String uId = '';
  List<int> grades = [];
  List<Users> userList = [];

  notificationInit() {
    NotificationService notificationService = NotificationService();

    notificationService.initInfo().then((value) async {
      String token = await NotificationService.getToken();
      log(":::::::TOKEN:::::: $token");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Screen'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              spacing: 12,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: nameTextController,
                  decoration: InputDecoration(
                    hintText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                TextFormField(
                  controller: ageTextController,
                  decoration: InputDecoration(
                    hintText: 'Age',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  controller: gradeTextController,
                  decoration: InputDecoration(
                    hintText: 'Grade',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  spacing: 8,
                  children: [
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        addStudent();
                      },
                      child: Text('Add Student'),
                    )),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        getUserData();
                      },
                      child: Text('Get All Students'),
                    )),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        updateUser(uId);
                      },
                      child: Text('Update Student'),
                    )),
                  ],
                ),
                // Text('Users',
                //     style:
                //         TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                // SizedBox(height: 10),
                // ListView.builder(
                //   itemBuilder: (context, index) {
                //     return ListTile(
                //       titleTextStyle: TextStyle(
                //           color: userList[index].passed == true
                //               ? Colors.green
                //               : Colors.red),
                //       title: Text(
                //           '${userList[index].name} ID: ${userList[index].id}'),
                //       trailing: IconButton(
                //           onPressed: () {},
                //           icon: Icon(Icons.delete, color: Colors.red)),
                //       subtitle: Text('Age: ${userList[index].age}'),
                //     );
                //   },
                //   itemCount: userList.length,
                //   shrinkWrap: true,
                // ),

                Text('Live Users',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                SizedBox(
                  height: 500,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .where('age', isGreaterThan: 25) // <- Corrected line
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text('Something went wrong');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text("Loading");
                      }

                      return ListView(
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;

                          return ListTile(
                            titleTextStyle: TextStyle(
                                color: data['grade'] == true
                                    ? Colors.green
                                    : Colors.red),
                            title: Text('${data['name']} ID: ${document.id}'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              spacing: 8,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      deleteUser(document.id);
                                    },
                                    icon:
                                        Icon(Icons.delete, color: Colors.red)),
                                IconButton(
                                    onPressed: () {
                                      grades =
                                          List<int>.from(data['grades'] ?? []);
                                      nameTextController.text = data['name'];
                                      ageTextController.text =
                                          data['age'].toString();
                                      uId = document.id;
                                    },
                                    icon:
                                        Icon(Icons.edit, color: Colors.green)),
                              ],
                            ),
                            subtitle: Text(
                                'Age: ${data['age']} grades: ${data['grades'].toString()}'),
                          );
                        }).toList(),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  getUserData() async {
    final snapshot = await users.get();

    userList.clear();
    for (var doc in snapshot.docs) {
      userList.add(
        Users(
          id: doc.id,
          name: doc['name'],
          age: doc['age'],
          passed: doc['grade'],
          grades: doc['grades'],
        ),
      );
    }
    setState(() {});
  }

  deleteUser(String id) {
    users.doc(id).delete();
  }

  updateUser(
    String id,
  ) {
    grades.add(int.tryParse(gradeTextController.text) ?? 0);
    users.doc(id).update(
      {
        'name': nameTextController.text,
        'age': ageTextController.text,
        'grade': (int.tryParse(gradeTextController.text) ?? 0) > 50,
        'grades': grades, // Example grades list
      },
    ).then((value) => log('User Updated'));
  }

  addStudent() {
    users.add({
      'name': nameTextController.text,
      'age': int.tryParse(ageTextController.text) ?? 0,
      'grade': (int.tryParse(gradeTextController.text) ?? 0) > 50,
      'grades': [int.tryParse(gradeTextController.text) ?? 0],
      'isFeatured': (int.tryParse(gradeTextController.text) ?? 0) > 50,
      'lastName': ' Doe',
      'email': 'AxXHt@example.com',
      'phone': '123-456-7890',
    }).then((value) => log('User Added'));
  }
}
