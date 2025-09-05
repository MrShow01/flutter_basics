import 'package:flutter/material.dart';

class ListTileGridWidget extends StatelessWidget {
  const ListTileGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.home, size: 30),
          title: Text(
            'This is a ListTile',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          subtitle: Text('This is a subtitle'),
          trailing: Icon(Icons.arrow_forward_ios, size: 20),
          dense: true,
          onTap: () => print('ListTile tapped!'),
          iconColor: Colors.green,
          isThreeLine: true,
          selected: true,
        ),
        GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          children: [
            Card(
              margin: EdgeInsets.all(8),
              elevation: 5,
              shadowColor: Colors.blue,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text('Grid Item 1'),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8),
              elevation: 5,
              shadowColor: Colors.blue,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text('Grid Item 2'),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8),
              elevation: 5,
              shadowColor: Colors.blue,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text('Grid Item 3'),
              ),
            ),
          ],
        )
      ],
    );
  }
}
