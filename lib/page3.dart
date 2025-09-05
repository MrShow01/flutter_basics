import 'package:flutter/material.dart';

import 'page1.dart';

class Page3 extends StatelessWidget {
  static const String routeName = '/page3';

  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 3'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).viewPadding.top,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Page1(
                        title: 'from page 3',
                      ),
                    ),
                  );
                },
                child: Text('Go to Page 4')),
          ],
        ),
      ),
    );
  }
}
