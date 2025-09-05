import 'package:flutter/material.dart';

import 'list_tile_grid_widget.dart';

class Sessions24 extends StatelessWidget {
  const Sessions24({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 10,
                //   physics: FixedExtentScrollPhysics(),
                itemBuilder: (context, index) => Card(
                  margin: EdgeInsets.all(16),
                  elevation: 5,
                  shadowColor: Colors.green,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  borderOnForeground: true,
                  surfaceTintColor: Colors.red,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 35, vertical: 8),
                    child: Column(
                      children: [
                        Text('this is a card index ${index}'),
                        Text('this is a card'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTileGridWidget(),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 1, mainAxisSpacing: 5),
              itemCount: 20,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Stack(
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
                        child: Text('Grid Item ${index + 1}'),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                          height: 15,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(5),
                                  topRight: Radius.circular(5)))),
                    )
                  ],
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
