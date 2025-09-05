import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class ExampleStatless extends StatelessWidget {
  const ExampleStatless({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Stateless Widget Example',
          style: TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              // Action for settings button
            },
          ),
        ],
        backgroundColor: Colors.red,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.red,
        items: <Widget>[
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.compare_arrows, size: 30),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
      // bottomNavigationBar: Container(
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.grey.shade400,
      //         blurRadius: 10,
      //         offset: const Offset(-1, -1), // changes position of shadow
      //       ),
      //     ],
      //     borderRadius: BorderRadius.only(
      //         topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      //   ),
      //   height: 100,
      //   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      //   child: Container(
      //     padding: const EdgeInsets.all(10),
      //     decoration: BoxDecoration(
      //       color: Color(0xff3CB7B5),
      //       borderRadius: BorderRadius.circular(15),
      //     ),
      //     child: Center(
      //       child: Text(
      //         'This is a Continer',
      //         style:
      //             TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      //       ),
      //     ),
      //   ),
      // ),

      body: SingleChildScrollView(
        child: Column(
          spacing: 10,
          children: [
            Text('This is a Stateless Widget Example',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            Text('This is a Stateless Widget Example',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            Wrap(
              direction: Axis.horizontal,
              spacing: 10,
              runSpacing: 10,
              children: [
                Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      'Text',
                      style: TextStyle(color: Colors.white),
                    )),
                Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      'Text Number',
                      style: TextStyle(color: Colors.white),
                    )),
                Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      'Text with a longer text',
                      style: TextStyle(color: Colors.white),
                    )),
                Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      'TX',
                      style: TextStyle(color: Colors.white),
                    )),
                Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      'TX is a long text that should wrap',
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
            SizedBox(height: 20.0),
            SizedBox(
                height: 150,
                width: 150,
                child: CircleAvatar(
                  child: Text('Circler Avatar'),
                )),
            SizedBox(
              height: 150,
              child: Wrap(
                direction: Axis.vertical,
                spacing: 10,
                runSpacing: 10,
                children: [
                  Text('Text1Text1Text1'),
                  Text('Text2Text1Text1'),
                  Text('Text3Text1Text1'),
                  Text('Text4Text1Text1'),
                  Text('Text4Text1Text1'),
                  Text('Text4Text1Text1'),
                  Text('Text4Text1Text1'),
                  Text('Text4Text1Text1'),
                  Text('Text4Text1Text1'),
                ],
              ),
            ),
            Container(
              height: 65,
              width: MediaQuery.of(context).size.width * 0.65,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 10,
                    offset: const Offset(1, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'This is a Continer',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      height: 65,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xff3CB7B5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          'This is a Continer',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 65,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.green, width: 2),
                      ),
                      child: Center(
                        child: Text(
                          'This is a Continer',
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 65,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.green, width: 2),
                      ),
                      child: Center(
                        child: Text(
                          'This is a Continer',
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 65,
                    width: MediaQuery.of(context).size.width * 0.461,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red,
                          blurRadius: 10,
                          offset:
                              const Offset(1, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'This is a Continer',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    height: 65,
                    width: MediaQuery.of(context).size.width * 0.461,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.green, width: 2),
                    ),
                    child: Center(
                      child: Text(
                        'This is a Continer',
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Flex(
                direction: Axis.horizontal,
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(
                      height: 65,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red,
                            blurRadius: 10,
                            offset: const Offset(
                                1, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'This is a Continer',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: 65,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.green, width: 2),
                      ),
                      child: Center(
                        child: Text(
                          'This is a Continer',
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                spacing: 10,
                children: [
                  Text('This is a Row Widget ',
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  Expanded(
                    child: Container(
                      height: 65,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          'This is a Continer',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}
