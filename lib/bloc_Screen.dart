import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_basics/controller/product_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocScreen extends StatelessWidget {
  const BlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer(
      bloc: context.read<ProductCubit>(),
      builder: (context, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: [
              Text(
                'Bloc State: $state',
                style: TextStyle(fontSize: 24),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () => context.read<ProductCubit>().increment(),
                    icon: Icon(Icons.add),
                  ),
                  IconButton(
                    onPressed: () => context.read<ProductCubit>().decrement(),
                    icon: Icon(Icons.remove),
                  ),
                ],
              )
            ],
          ),
        );
      },
      listener: (context, state) {
        // This listener can be used to show SnackBars or perform other actions
        // based on state changes.
        log(state.toString());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Bloc state changed: $state'),
            duration: Duration(milliseconds: 200),
          ),
        );
      },
    ));
  }
}
