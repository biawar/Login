import 'package:rxdart/rxdart.dart';
import '../home/HomeWidget.dart';
import 'Home_events.dart';
import 'Home_State.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

class HomeBloc extends Bloc<Home_events, Home_State> {
  @override
  // TODO: implement initialState
  Home_State get initialState => InitState();
  
  @override
  Stream<Home_State> mapEventToState(Home_events event) async*{
    print('dentro do bloco!');
    if (event is IsEmailChanged){
      yield currentState.copyWith(
        email: event.email);
      print(event.email);
    }

    if (event is IsPasswordChanged){
      yield currentState.copyWith(
        password: event.password);
      print(currentState.password);
    }

  }
}