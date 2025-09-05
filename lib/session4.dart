import 'package:flutter/material.dart';

class Session4 extends StatelessWidget {
  const Session4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          Container(
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
                  style: TextStyle(color: Color(0xffFF3726), fontSize: 12),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '1',
                      style: TextStyle(color: Color(0xffFF3726), fontSize: 32),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 2, right: 2),
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
          ListTile(
            enabled: true,
            dense: true,

            title: Text(
              'List Tile Title',
            ),
            trailing: Text(
              'Tile Trailing',
            ),
            // leading: Text('Tile Leading'),
            subtitle: Text('Tile Subtitle'),
          ),
          Stack(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 175, 40, 40),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(8),
                child: Center(
                  child: Text(
                    'This is a container widget with text inside it.',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 30, 0, 255),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              Positioned(
                top: 25,
                left: MediaQuery.of(context).size.width / 2 - 25,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              Positioned(
                top: 38,
                left: MediaQuery.of(context).size.width / 2 - 14,
                child: Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 0, 0, 0),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ],
          ),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 0.9,
            ),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) => Card(
              semanticContainer: true,
              elevation: 3,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'This is a card widget ${index + 1}',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              ///physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Card(
                semanticContainer: true,
                margin: const EdgeInsets.all(16),
                elevation: 3,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'This is a card widget ${index + 1}',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 180,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              // shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  height: 150,
                  decoration: BoxDecoration(
                    color: Color(0xffCAD6FF),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    spacing: 16,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.person, color: Colors.white, size: 130),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'First Name',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Last Name',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 600,
            child: GridView.builder(
              itemCount: 10,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              //   physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 1.8,
              ),
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: Color(0xffCAD6FF),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.person, color: Colors.white, size: 180),
                      Text(
                        'First Name',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      Text(
                        'Last Name',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).viewPadding.bottom,
          ),
        ],
      ),
    );
  }
}
