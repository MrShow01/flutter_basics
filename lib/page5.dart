import 'package:flutter/material.dart';

class Page5 extends StatelessWidget {
  const Page5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cart'),
        actions: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xffF4F4F4),
              borderRadius: BorderRadius.circular(50),
            ),
            margin: EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () {
                // Action for shopping cart icon
              },
            ),
          ),
        ],
      ),
    );
  }
}
