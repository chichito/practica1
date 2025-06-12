import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practica1/bloc/counter_bloc.dart';
import 'package:practica1/cubit/counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(create: (context) => CounterBloc()),
        BlocProvider<CounterCubit>(create: (context) => CounterCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //final counterCubit = context.watch<CounterCubit>(); //se actuliza cada vez que cambia el estado
    return Scaffold(
      appBar: AppBar(title: const Text("Ejemplo Practica 1 BLOC")),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('CounterCubit'), // ${counterCubit.state}'),
            BlocBuilder<CounterCubit, int>(
              builder: (context, state) {
                return Text('$state');
              },
            ),
            const Text('CounterBloc:'),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(state.email.toString());
              },
            ),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(state.counter.toString());
              },
            ),
          ],
        ),
      ),

      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(IncrementEvent());
            }, //=> context.read<CounterCubit>().increment(),
            child: const Icon(Icons.add),
          ),
          SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(DecrementEvent());
            }, // => context.read<CounterCubit>().decrement(),
            child: const Icon(Icons.remove),
          ),
          SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().increment(),
            child: const Icon(Icons.access_alarms),
          ),
          SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().decrement(),
            child: const Icon(Icons.access_alarm_sharp),
          ),
        ],
      ),
    );
  }
}
