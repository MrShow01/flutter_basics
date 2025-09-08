import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_basics/controller/cubit_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'animation.dart';
import 'controller/counter_cubit.dart';
import 'controller/product_cubit.dart';
import 'models/example_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Bloc.observer = BlocObserv();
  // ProductCubit().increment();
  // final cubit = CubitController();
  // log(cubit.state.toString());
  // cubit.increment();
  // cubit.increment();
  // cubit.increment();
  // log(cubit.state.toString());
  // cubit.decrement();
  // log(cubit.state.toString());
  final jsonData = {
    "message": "This is an example JSON file.",
    "success": true,
    "status": 200,
    "payload": [
      {
        "name": "Product Name",
        "price": 19.99,
        "inStock": true,
        "tags": ["example", "json", "data"],
        "dimensions": {"width": 10, "height": 20, "depth": 5},
        "warehouseLocation": {"latitude": 37.7749, "longitude": -122.4194},
        "description": "This is an example JSON file."
      },
      {
        "name": "Product Name",
        "price": 19.99,
        "inStock": true,
        "tags": ["example", "json", "data"],
        "dimensions": {"width": 10, "height": 20, "depth": 5},
        "warehouseLocation": {"latitude": 37.7749, "longitude": -122.4194},
        "description": "This is an example JSON file."
      },
      {
        "name": "Product Name",
        "price": 19.99,
        "inStock": true,
        "tags": ["example", "json", "data"],
        "dimensions": {"width": 10, "height": 20, "depth": 5},
        "warehouseLocation": {"latitude": 37.7749, "longitude": -122.4194},
        "description": "This is an example JSON file."
      }
    ]
  };
  ExampleModel exampleModel = ExampleModel();
  exampleModel = ExampleModel.fromJson(jsonData);
  log(exampleModel.message ?? '');
  log(exampleModel.product![0].price.toString());
  log(exampleModel.product![1].price.toString());
  log(exampleModel.product![2].price.toString());

  //final productBloc = ProductBloc();
  // log('Product Bloc state: ${productBloc.state}');
  // productBloc.add(ProductPriceIncrement());
  // log('Product Bloc state after increment: ${productBloc.state}');
  // await Future.delayed(const Duration(milliseconds: 100));
  // log('Product Bloc state after delay: ${productBloc.state}');
  // productBloc.add(ProductPriceDecrement());
  // log('Product Bloc state after decrement: ${productBloc.state}');
  // await Future.delayed(const Duration(milliseconds: 100));
  // log('Product Bloc state after second decrement: ${productBloc.state}');
  // final bloc = CounterBloc();
  // log('Bloc state: ${bloc.state}');
  // bloc.add(CounterIncrement());
  // log('Bloc state after increment: ${bloc.state}');
  // await Future.delayed(const Duration(milliseconds: 300));
  // log('Bloc state after delay: ${bloc.state}');
  // bloc.add(CounterDecrement());
  // log('Bloc state after decrement: ${bloc.state}');
  // await Future.delayed(const Duration(milliseconds: 300));

  // log('Bloc state after second decrement: ${bloc.state}');

  //ExampleModel model = ExampleModel.fromJson(data);

  // log(jsonEncode(data));
  // log(jsonDecode(jsonEncode(data)).toString());

//  log(model.name.toString());
  // log(model.toJson().toString());
  // sqfliteFfiInit();

  // databaseFactory = databaseFactoryFfi;

  // Stream<int> stream = countStream();
  // stream.listen((value) {
  //   log('Received: $value');
  // });

  // try {
  //   dynamic num = 5.5;
  //   int result = num;
  //   log('Result: $result');
  // } catch (e) {
  //   log('Error occurred: $e');
  // }
  //final path = Directory.systemTemp.path;
  //Hive..init(path);
  //  ..registerAdapter<PersonA>();
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider<CounterBloc>(
        create: (context) => CounterBloc(),
      ),
      BlocProvider<CubitController>(
        create: (context) => CubitController(),
      ),
      BlocProvider<CounterCubit>(
        create: (context) => CounterCubit(),
      ),
      BlocProvider<ProductCubit>(
        create: (context) => ProductCubit(),
      ),
      // BlocProvider<ProductCubit>(
      //   create: (context) => ProductCubit(),
      // ),
      // BlocProvider<ProductBloc>(
      //   create: (context) => ProductBloc(),
      // ),
      // BlocProvider<CounterCubit>(
      //   create: (context) => CounterCubit(),
      // ),
      // BlocProvider<CounterBloc>(
      //   create: (context) => CounterBloc(),
      // ),
    ], child: MyApp()),
  );
}

Stream<int> countStream() async* {
  for (int i = 1; i <= 50; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

Stream<double> countStream2() async* {
  for (double i = 1; i <= 50; i++) {
    await Future.delayed(Duration(seconds: 2));
    i = i / 0;
    yield i;
  }
}

Future<void> printData() async {
  log('Print Data');
  await Future.delayed(Duration(seconds: 2), () {
    log('Data printed after 2 seconds');
  });
  log('Print Data after delay');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.red),

      home: AnimationScreen(),

      // initialRoute: '/page2',///

      // routes: {
      //   '/': (context) => Page1(
      //         title: 'Page 1',
      //       ),
      //   '/page2': (context) => Page2(),
      //   '/page3': (context) => Page3(),
      //   '/page4': (context) => Page4(),
      //   '/page5': (context) => Page5(),
      //   '/page6': (context) => Page6(),
      // },
    );
  }
}
