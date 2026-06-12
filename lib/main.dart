import 'package:counter/bloc/counter_bloc.dart';
import 'package:counter/bloc/counter_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 58, 183, 114)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    //wrap scaffold with BlocBUilder that use to notify UI my Bloc
    //exitst return scaffold from widget build ==> wrap scafoold by blocBuilder and give it parametar
    return BlocProvider(
      //create : (buildContext context){retrurn CounterCubit}
      create: (context) => CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  return Text(
                    state.count.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  backgroundColor:
                      state.count >= 10 ? Colors.red : Colors.black26,
                  onPressed: () =>
                      context.read<CounterBloc>().add(IncrementEvent()),
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
                const SizedBox(height: 15),
                FloatingActionButton(
                  backgroundColor: state.count >= 10
                      ? const Color.fromARGB(255, 59, 56, 55)
                      : const Color.fromARGB(66, 177, 25, 38),
                  onPressed: () =>
                      context.read<CounterBloc>().add(DecrementEvent()),
                  tooltip: 'Decrement',
                  child: const Icon(Icons.dashboard),
                ),
              ],
            );
          },
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
