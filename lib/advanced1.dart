import 'dart:developer';

import 'package:flutter/material.dart';

class Advanced1 extends StatefulWidget {
  const Advanced1({super.key});

  @override
  State<Advanced1> createState() => _Advanced1State();
}

class _Advanced1State extends State<Advanced1> {
  String name = 'Flutter Basics';
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            name,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          (isLoading)
              ? CircularProgressIndicator()
              : Image.network(
                  'https://images.pexels.com/photos/33027861/pexels-photo-33027861.jpeg',
                  loadingBuilder: (context, child, loadingProgress) =>
                      CircularProgressIndicator(),
                ),
          Text(
            'This is a simple example of Future.delayed in Flutter.',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Future<String> fetchData() async {
    isLoading = true;
    setState(() {});
    name = 'Flutter Basics before delay';
    log(name);
    await Future.delayed(Duration(seconds: 2), () {
      isLoading = false;
      setState(() {});
    });
    log(name);
    return name;
  }

  Future<void> printData() async {
    log('Print Data');
    await Future.delayed(Duration(seconds: 2), () {
      log('Data printed after 2 seconds');
    });
    log('Print Data after delay');
  }
}
