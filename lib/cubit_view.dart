import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_basics/controller/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitScreen extends StatelessWidget {
  const CubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CounterBloc, int>(
          bloc: context.read<CounterBloc>(),
          listener: (context, state) {
            log(state.toString());
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Counter value: $state'),
                duration: Duration(milliseconds: 200),
              ),
            );
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Counter state: $state',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  'Counter Value: ${context.read<CounterBloc>().state}',
                  style: TextStyle(fontSize: 24),
                ),
                ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(CounterIncrement());
                      context.read<CounterBloc>().increment();
                      context.read<CounterBloc>().value;
                      //   context.read<CounterCubit>().increment();
                      log('state $state');
                    },
                    child: Text('Increment'))
              ],
            );
          }),
    );
  }
}
