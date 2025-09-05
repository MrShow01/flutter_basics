import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class Session32 extends StatelessWidget {
  Session32({super.key});
  final primaryColor = Color(0xff595085);
  final gradientFirstColor = Color(0xff25196B);
  final gradientLastColor = Color(0xffD994A7);
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text('Session 3.2'),
            titleTextStyle: TextStyle(
              color: primaryColor,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            centerTitle: true,
            iconTheme: IconThemeData(color: primaryColor),
            leading: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.menu),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.settings_outlined),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  Text('News',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      )),
                  Row(
                    spacing: 16,
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            Container(
                              height: 80,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    gradientFirstColor,
                                    gradientLastColor
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                'Short news title will be here',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Image.asset(
                              'assets/stars.png',
                              width: 210,
                              height: 80,
                              alignment: Alignment.centerRight,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            Container(
                              height: 80,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    gradientFirstColor,
                                    Color(0xff94D9B4)
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                'Short news title will be here',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Image.asset(
                              'assets/stars.png',
                              width: 210,
                              height: 80,
                              alignment: Alignment.centerRight,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  RichText(
                      text: TextSpan(
                    text: 'Latest News',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                          text: ' (See all)',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(
                              text: ' (See all)',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                    ],
                  )),
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
                  SizedBox(
                    width: 250,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            textStyle: WidgetStatePropertyAll(
                                TextStyle(color: Colors.white)),
                            backgroundColor:
                                WidgetStatePropertyAll(primaryColor)),
                        onPressed: () {
                          if (MediaQuery.of(context).orientation ==
                              Orientation.portrait) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text('Button clicked in portrait mode!'),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text('Button clicked in landscape mode!'),
                              ),
                            );
                          }
                        },
                        child: Text('Click Me',
                            style: TextStyle(color: Colors.white))),
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    child: Icon(Icons.delete),
                  ),
                  Form(
                    key: formkey,
                    child: Column(
                      spacing: 16,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Enter your name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            focusedBorder: OutlineInputBorder(
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
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: 'Enter your Number',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            focusedBorder: OutlineInputBorder(
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
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: primaryColor, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: CountryCodePicker(
                      onChanged: print,
                      initialSelection: 'EG',
                      favorite: ['+20', 'EG'],
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                    ),
                  ),
                  Pinput(
                    onCompleted: (pin) => print(pin),
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              formkey.currentState?.validate();
            },
            backgroundColor: primaryColor,
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          )),
    );
  }
}
