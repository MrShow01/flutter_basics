import 'package:flutter/material.dart';
import 'package:flutter_basics/controller/product_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Page1 extends StatefulWidget {
  static const String routeName = '/';
  const Page1({
    super.key,
  });

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      // drawer: Container(
      //   child: Text('Drawer is not implemented yet!'),
      //   color: Colors.deepPurple,
      // ),
      // drawer: Drawer(
      //   child: ListView(
      //     children: [
      //       DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Colors.blue,
      //         ),
      //         child: Text(
      //           'Drawer Header',
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 24,
      //           ),
      //         ),
      //       ),
      //       ListTile(
      //         title: Text('Page 1'),
      //         onTap: () {
      //           Navigator.of(context).push(MaterialPageRoute(
      //               builder: (context) =>
      //                   Page1(title: 'Page 1'))); // or use named route
      //         },
      //       ),
      //       ListTile(
      //         title: Text('Page 2'),
      //         onTap: () {
      //           Navigator.of(context).pushNamed('/page2');
      //         },
      //       ),
      //       ListTile(
      //         title: Text('Page 3'),
      //         onTap: () {
      //           Navigator.of(context).pushNamed('/page3');
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: [
      //       DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Colors.blue,
      //         ),
      //         child: Text(
      //           'Drawer Header',
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 24,
      //           ),
      //         ),
      //       ),
      //       ListTile(
      //         title: Text('Page 1'),
      //         onTap: () {
      //           Navigator.of(context).pushNamed('/');
      //         },
      //       ),
      //       ListTile(
      //         title: Text('Page 2'),
      //         onTap: () {
      //           Navigator.of(context).pushNamed('/page2');
      //         },
      //       ),
      //       ListTile(
      //         title: Text('Page 3'),
      //         onTap: () {
      //           Navigator.of(context).pushNamed('/page3');
      //         },
      //       ),
      //     ],
      //   ),
      // ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).viewPadding.top,
            ),
            ElevatedButton(
                onPressed: () {
                  // Navigator.of(context)
                  //     .pushNamedAndRemoveUntil('/page4', (route) => false);
                  // Navigator.of(context).canPop()
                  //     ? Navigator.of(context).pop()
                  //     : null;
                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (context) => Page3()));
                  // Navigator.of(context)
                  //     .pushNamedAndRemoveUntil('/page3', (route) => false);
                  // Navigator.of(context).pushNamed('/page2');
                  // // Navigator.of(context)
                  // //     .push(MaterialPageRoute(builder: (context) => Page2()));
                  context.read<ProductCubit>().openDb();
                },
                child: Text('Init Database')),
            ElevatedButton(
                onPressed: () async {
                  // Navigator.of(context)
                  //     .pushNamedAndRemoveUntil('/page4', (route) => false);
                  // Navigator.of(context).canPop()
                  //     ? Navigator.of(context).pop()
                  //     : null;
                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (context) => Page3()));
                  // Navigator.of(context)
                  //     .pushNamedAndRemoveUntil('/page3', (route) => false);
                  // Navigator.of(context).pushNamed('/page2');
                  // // Navigator.of(context)
                  // //     .push(MaterialPageRoute(builder: (context) => Page2()));
                  await context.read<ProductCubit>().getData();
                  setState(() {});
                },
                child: Text('Init Database')),
            Text(
              context.watch<ProductCubit>().example.name.toString(),
              style: TextStyle(fontSize: 24),
            ),
            Text(
              context.watch<ProductCubit>().example.value.toString(),
              style: TextStyle(fontSize: 24),
            ),
            Text(
              context.watch<ProductCubit>().example.num.toString(),
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
