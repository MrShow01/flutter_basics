import 'package:flutter/material.dart';

class StateFullExample extends StatefulWidget {
  const StateFullExample({super.key});

  @override
  State<StateFullExample> createState() => _StateFullExampleState();
}

class _StateFullExampleState extends State<StateFullExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Stateful Widget Example',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('This is a Stateful Widget Example',
                style: TextStyle(fontSize: 20, color: Colors.blueAccent)),
            Text('This is a Stateful Widget Example',
                style: TextStyle(fontSize: 20, color: Colors.blueAccent)),
            Text('This is a Stateful Widget Example',
                style: TextStyle(fontSize: 20, color: Colors.blueAccent)),
            Text('This is a Stateful Widget Example',
                style: TextStyle(fontSize: 20, color: Colors.blueAccent)),
            FittedBox(
              child: Row(
                spacing: 8,
                children: [
                  Text('Row Example',
                      style: TextStyle(fontSize: 20, color: Colors.blueAccent)),
                  Text('Row Example',
                      style: TextStyle(fontSize: 20, color: Colors.blueAccent)),
                  Text('Row Example',
                      style: TextStyle(fontSize: 20, color: Colors.blueAccent)),
                  Text('Row Example',
                      style: TextStyle(fontSize: 20, color: Colors.blueAccent)),
                  Text('Row Example',
                      style: TextStyle(fontSize: 20, color: Colors.blueAccent)),
                  Text('Row Example',
                      style: TextStyle(fontSize: 20, color: Colors.blueAccent)),
                ],
              ),
            ),
            SizedBox(
              height: 150,
              child: Wrap(
                direction: Axis.vertical,
                runSpacing: 10,
                spacing: 10,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 15,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    child: Text('Wrap Example',
                        style:
                            TextStyle(fontSize: 20, color: Colors.blueAccent)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 15,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    child: Text('WX',
                        style:
                            TextStyle(fontSize: 20, color: Colors.blueAccent)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 15,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    child: Text('Wrap Example',
                        style:
                            TextStyle(fontSize: 20, color: Colors.blueAccent)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 15,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    child: Text(' Example',
                        style:
                            TextStyle(fontSize: 20, color: Colors.blueAccent)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 15,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    child: Text('Wrap ',
                        style:
                            TextStyle(fontSize: 20, color: Colors.blueAccent)),
                  ),
                ],
              ),
            ),
            Wrap(
              direction: Axis.horizontal,
              runSpacing: 10,
              spacing: 10,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 15,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: Text('Wrap Example',
                      style: TextStyle(fontSize: 20, color: Colors.blueAccent)),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 15,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: Text('WX',
                      style: TextStyle(fontSize: 20, color: Colors.blueAccent)),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 15,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: Text('Wrap Example',
                      style: TextStyle(fontSize: 20, color: Colors.blueAccent)),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 15,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: Text(' Example',
                      style: TextStyle(fontSize: 20, color: Colors.blueAccent)),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 15,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: Text('Wrap ',
                      style: TextStyle(fontSize: 20, color: Colors.blueAccent)),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 15,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: const Center(
                child: Text(
                  'Container Example',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 100,
              width: 100,
              child: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  'Container Example',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        print('Cancel Button Pressed');
                      },
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text('Cancel Button',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.red)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        print('Confirm Button Pressed');
                      },
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.green,
                              blurRadius: 15,
                              offset: Offset(0, 5),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text('Confirm Button',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Flex(
                direction: Axis.horizontal,
                spacing: 10,
                children: [
                  Flexible(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        print('Cancel Button Pressed');
                      },
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text('Cancel Button ',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.red)),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        print('Confirm Button Pressed');
                      },
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.green,
                              blurRadius: 15,
                              offset: Offset(0, 5),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text('Confirm Button',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  spacing: 10,
                  children: [
                    InkWell(
                      onTap: () {
                        print('Cancel Button Pressed');
                      },
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text('Cancel Button',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.red)),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        print('Confirm Button Pressed');
                      },
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.green,
                              blurRadius: 15,
                              offset: Offset(0, 5),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text('Confirm Button',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        print('Confirm Button Pressed');
                      },
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.green,
                              blurRadius: 15,
                              offset: Offset(0, 5),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text('Confirm Button',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: CurvedNavigationBar(
      //   backgroundColor: Colors.blueAccent,
      //   items: <Widget>[
      //     Icon(Icons.add, size: 30),
      //     Icon(Icons.list, size: 30),
      //     Icon(Icons.compare_arrows, size: 30),
      //   ],
      //   onTap: (index) {
      //     //Handle button tap
      //   },
      // ),
    );
  }
}
