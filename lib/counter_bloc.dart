import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class CounterBloc extends BlocBase {

var _counterController = BehaviorSubject<int>.seeded(0); //the BehaviorSubject gets the last value
//output of data
ValueObservable<int> get outCounter => _counterController.stream; //stream
//input of data
Sink<int> get inCounter => _counterController.sink;

increment(){
    inCounter.add(_counterController.value+1); //gets the counter value and adds 1
}

//Consumer example 

int counter = 0;
onChanged(){
  counter++;
  notifyListeners();
}


  @override
  void dispose() {
    // will be called automatically
    super.dispose();
    _counterController.close();
  }
}
