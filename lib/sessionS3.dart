import 'package:flutter/material.dart';

class SessionsS3 extends StatelessWidget {
  SessionsS3({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cart', style: TextStyle()),
        actionsIconTheme: IconThemeData(color: Colors.green),
        backgroundColor: Colors.white,
        bottom: PreferredSize(
            preferredSize: Size(200, 50),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'Total: \$100',
                style: TextStyle(fontSize: 20),
              ),
            )),
        bottomOpacity: 0.7,
        elevation: 5,
        excludeHeaderSemantics: true,
        // flexibleSpace: Container(
        //   decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //       colors: [Colors.red, Colors.orange],
        //       begin: Alignment.topLeft,
        //       end: Alignment.bottomRight,
        //     ),
        //   ),
        // ),
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            //  Navigator.pop(context);
          },
        ),
        leadingWidth: 50,
        primary: true,
        foregroundColor: Colors.red,
        shadowColor: Colors.black,
        titleSpacing: 30,

        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Icon(
              Icons.shopping_cart,
              color: Colors.red,
            ),
          ),
          Icon(Icons.arrow_forward_ios),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 80,
                width: 180,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    // gradient: SweepGradient(colors: [
                    //   Colors.red,
                    //   //  Colors.orange,
                    //   Colors.yellow,
                    //   Colors.green,
                    //   //Colors.blue,
                    //   Colors.indigo,
                    //   Colors.purple,
                    // ]),
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    // backgroundBlendMode: BlendMode.dstOut,
                    image:
                        DecorationImage(image: AssetImage('assets/stars.png')),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.black,
                    //     blurRadius: 10,
                    //     offset: Offset(0, 0), // changes position of shadow
                    //   )
                    // ],
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(
                height: 20,
              ),
              RichText(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'Hello ',
                        style: TextStyle(color: Colors.red, fontSize: 20),
                        children: [
                          TextSpan(
                              text: 'Flutter',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 20)),
                          TextSpan(
                              text: 'Flutter  Flutter Flutter Flutter',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 20)),
                        ]),
                    TextSpan(
                        text: 'World',
                        style: TextStyle(color: Colors.blue, fontSize: 20)),
                    TextSpan(
                        text: '!!!',
                        style: TextStyle(color: Colors.amber, fontSize: 20)),
                  ])),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          style: ButtonStyle(
                              elevation: WidgetStatePropertyAll(5),
                              foregroundColor:
                                  WidgetStatePropertyAll(Colors.white),
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.red)),
                          onPressed: () {
                            bool isPortrait =
                                MediaQuery.of(context).orientation ==
                                    Orientation.portrait;
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    '${MediaQuery.of(context).orientation} is ${isPortrait ? 'Portrait' : 'Landscape'}'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                          child: Text(
                            'Click Me',
                            style: TextStyle(),
                          )),
                    ),
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            _formKey.currentState?.validate();
                          },
                          child: Text('Click Me')),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Image.asset(
                'assets/icon.png',
                width: 100,
                height: 100,
                fit: BoxFit.scaleDown,
              ),
              Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/250px-Image_created_with_a_mobile_phone.png',
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: 20,
              ),
              Icon(
                Icons.search_off_outlined,
                size: 100,
                color: Colors.red,
                shadows: [
                  Shadow(
                    color: Colors.black,
                    offset: Offset(2, 2),
                    blurRadius: 5,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Enter name',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.text_fields),
                        suffixIcon: Icon(Icons.clear),
                      ),
                      validator: (value) => (value != null) && value.isEmpty
                          ? 'Please enter your name'
                          : null,
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                      cursorColor: Colors.red,
                      cursorWidth: 2,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: 'phone',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.text_fields),
                        suffixIcon: Icon(Icons.clear),
                      ),
                      validator: (value) => (value != null) && value.isEmpty
                          ? 'Please enter your phone'
                          : (value!.length < 10)
                              ? 'Please enter a valid phone number'
                              : null,
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                      cursorColor: Colors.red,
                      cursorWidth: 2,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
