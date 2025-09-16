import 'dart:developer';

import 'package:flutter/material.dart';

class Session3 extends StatelessWidget {
  Session3({super.key});
  Color primaryColor = Color(0xff595085);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            'Home',
            style: TextStyle(color: primaryColor),
          ),
          leading: IconButton(
            onPressed: () {
              log('Menu Button Clicked!');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Menu button clicked!'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            icon: Icon(
              Icons.menu_outlined,
              color: primaryColor,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                log('Settings Button Clicked!');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Settings button clicked!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              icon: Icon(
                Icons.settings_outlined,
                color: primaryColor,
              ),
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text('News',
                    style: TextStyle(fontSize: 24, color: primaryColor)),
                SizedBox(
                  height: 16,
                ),
                Row(
                  spacing: 10,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 80,
                          alignment: Alignment.center,
                          constraints: BoxConstraints(maxWidth: 180),
                          clipBehavior: Clip.hardEdge,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Color(0xff25196B),
                              Color(0xffD994A7),
                            ]),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'Short news title will be here',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Image.asset(
                          'assets/stars.png',
                          height: 81,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Color(0xff25196B),
                            Color(0xff94D9B4),
                          ]),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Daily Tasks:',
                  style: TextStyle(color: primaryColor, fontSize: 24),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  spacing: 16,
                  children: [
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0xffF6F5FB),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Daily astromeditation',
                              style:
                                  TextStyle(color: primaryColor, fontSize: 12),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '3',
                                  style: TextStyle(
                                      color: primaryColor, fontSize: 32),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 2, right: 2),
                                  child: Image.asset(
                                    'assets/icon.png',
                                    height: 15,
                                    width: 15,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0xffFFF4F4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Daily sleep astromeditation',
                              style: TextStyle(
                                  color: Color(0xffFF3726), fontSize: 12),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '1',
                                  style: TextStyle(
                                      color: Color(0xffFF3726), fontSize: 32),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 2, right: 2),
                                  child: Image.asset(
                                    'assets/icon.png',
                                    height: 15,
                                    width: 15,
                                    fit: BoxFit.cover,
                                    color: Color(0xffFF3726),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0xffF5F9F9),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Daily mantra',
                              style: TextStyle(
                                  color: Color(0xff479696), fontSize: 12),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '2',
                                  style: TextStyle(
                                      color: Color(0xff479696), fontSize: 32),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 2, right: 2),
                                  child: Image.asset(
                                    'assets/icon.png',
                                    height: 15,
                                    width: 15,
                                    fit: BoxFit.cover,
                                    color: Color(0xff479696),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                LinearProgressIndicator(
                  value: 0.7,
                  minHeight: 8,
                  borderRadius: BorderRadius.circular(15),
                  backgroundColor: Color(0xffE0E0E0),
                  valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                ),
                SizedBox(
                  height: 16,
                ),
                RichText(
                    text: TextSpan(
                  text:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
                  style: TextStyle(
                      color: primaryColor, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                        text:
                            'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        children: [
                          TextSpan(
                              text:
                                  'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                              children: [
                                TextSpan(
                                  text:
                                      'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green),
                                ),
                              ]),
                        ]),
                  ],
                )),
                ElevatedButton(
                  onPressed: () {
                    log('Button Clicked!');
                  },
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(primaryColor),
                      textStyle: WidgetStatePropertyAll(
                          TextStyle(color: Colors.white))),
                  child: Text(
                    'Click Me',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Image.asset(
                  'assets/icon.png',
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 16,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Enter your name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: primaryColor, width: 2),
                          ),
                        ),
                        validator: (value) => value == null || value.isEmpty
                            ? 'Please enter your name'
                            : null,
                        style: TextStyle(color: primaryColor, fontSize: 16),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: 'Enter your Number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: primaryColor, width: 2),
                          ),
                        ),
                        validator: (value) => value == null || value.isEmpty
                            ? 'Please enter your Number'
                            : (!RegExp(r'^[0-9]+$').hasMatch(value))
                                ? 'only numbers allawed'
                                : (value.length < 8)
                                    ? 'You have to enter at least 8 numbers'
                                    : null,
                        style: TextStyle(color: primaryColor, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _formKey.currentState?.validate();

            log('Floating Action Button Clicked!');
            if (MediaQuery.of(context).orientation == Orientation.portrait) {
              log('Portrait Mode');
            } else {
              log('Landscape Mode');
            }
          },
          backgroundColor: primaryColor,
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
