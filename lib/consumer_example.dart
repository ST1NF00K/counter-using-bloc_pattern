import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:testing_bloc_pattern/counter_bloc.dart';

class ConsumerExample extends StatefulWidget {
  @override
  _ConsumerExampleState createState() => _ConsumerExampleState();
}

class _ConsumerExampleState extends State<ConsumerExample> {


  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Consumer<CounterBloc>(
            builder: (BuildContext context, CounterBloc bloc) {
              return Text(bloc.counter.toString());
            },
          ),
          Container(
            height: 25,
          ),
          Consumer<CounterBloc>(
            builder: (BuildContext context, CounterBloc bloc) {
              return 
            RaisedButton(
              onPressed: () {
                bloc.onChanged();
              },
              child: Icon(Icons.add),
            );
            },
          ),
          
        ],
      ),
    );
  }
}