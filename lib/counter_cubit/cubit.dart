import 'package:amit_5/counter_cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState>{
  CounterCubit(super.initialState);

  int counter = 0;


  void increment(){
    counter++;
    emit(IncrementState());
    print(counter);
  }

  void decrement(){
    if(counter > 0) {
      counter--;
      emit(DecrementState()); 
    }
    print(counter);
  }

}