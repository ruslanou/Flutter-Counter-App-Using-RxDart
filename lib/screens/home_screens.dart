import 'package:bloc_example/src/blocs/counter_bloc/counter_bloc.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final CounterBloc counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<int>(
            stream: counterBloc.pressedCount,
            builder: (context, snapshot) {
              return Text(
                'Counter App request RIO - ${snapshot.data.toString()}',
              );
            }),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Lu udah mencet ini:',
            ),
            StreamBuilder<int>(
                stream: counterBloc.pressedCount,
                builder: (context, snapshot) {
                  return Text(
                    '${snapshot.data.toString()}',
                    style: Theme.of(context).textTheme.display1,
                  );
                }),
            Text('kali')
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 100.0,
        height: 100.0,
        child: FloatingActionButton(
          onPressed: () {
            counterBloc.incrementCounter.add(null);
          },
          tooltip: 'Increment',
          child: Text(
            "+",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30
            ),
          ),
        ),
      ),
    );
  }
}