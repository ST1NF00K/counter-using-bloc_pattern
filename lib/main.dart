import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:testing_bloc_pattern/consumer_example.dart';
import 'package:testing_bloc_pattern/counter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        blocs: [
          Bloc((i) => CounterBloc()),
      ],
          child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final bloc = BlocProvider.getBloc<CounterBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: (){
                Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ConsumerExample()),
            );
              },
              child: Text("Consumer Example"),
            )
            ,
            Text(
              'You have pushed the button this many times:',
            ),
             StreamBuilder(
                stream: bloc.outCounter,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return Text(
                    '${snapshot.data}',
                    style: Theme.of(context).textTheme.display1,
                  );
                },
              ),
          ],
        ),
      ),
       floatingActionButton: 
            FloatingActionButton(
              onPressed: () {
                bloc.increment();
              },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ));
  }
}