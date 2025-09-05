import 'package:flutter/material.dart';

class Session42 extends StatelessWidget {
  const Session42({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).viewPadding.top,
          ),
          Card(
            color: Colors.white,
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'This is a card widget',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Card(
                color: Colors.white,
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'This is a card widget',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'This is a card widget',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'This is a card widget',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'This is a card widget',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          ListView.builder(
            itemCount: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  'This is a ListTile widget ${index + 1}',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Schyler',
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'This is a subtitlea subtitlea subtitlea subtitlea subtitlea subtitle',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(color: Colors.grey),
                ),
                leading: Icon(
                  Icons.list,
                  color: Colors.black,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
              );
            },
          ),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Card(
                    color: Colors.greenAccent,
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'This is a card widget ${index + 1}',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
              separatorBuilder: (context, index) =>
                  Center(child: Text(index.toString())),
              itemCount: 5),
          SizedBox(
            height: 16,
          ),
          GridView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1, crossAxisCount: 2),
            children: [
              Card(
                color: Colors.blue,
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'This is a card widget',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Card(
                color: Colors.red,
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'This is a card widget',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Card(
                color: Colors.red,
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'This is a card widget',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Card(
                color: Colors.blue,
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'This is a card widget',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          GridView.builder(
            itemCount: 5,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) => Card(
              color: (index.isEven)
                  ? Colors.red
                  : (index == 3)
                      ? Colors.grey
                      : Colors.blue,
              elevation: 10,
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
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            children: [
              Card(
                color: Colors.purple,
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'This is a card widget',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Card(
                color: Colors.orange,
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'This is a card widget',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: Card(
                  color: Colors.yellow,
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'This is a card widget',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 150,
                width: 150,
                child: Card(
                  color: Colors.red,
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'This is a card widget',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
                width: 100,
                child: Card(
                  color: Colors.green,
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'This is a card widget',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 75,
                width: 75,
                child: Card(
                  color: Colors.black,
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'This is a card widget',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 150,
                bottom: 0,
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Card(
                    color: Colors.white,
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'This is a card widget',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
