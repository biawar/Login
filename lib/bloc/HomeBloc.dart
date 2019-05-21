 import 'package:rxdart/rxdart.dart';
 import '../home/HomeWidget.dart';
 import 'Home_events.dart';
 import 'Home_State.dart';
 import 'package:bloc/bloc.dart';
 import 'package:flutter_bloc/flutter_bloc.dart';
 import 'dart:async';
 

 class HomeBloc extends Bloc<Home_events, Home_State> {
   @override
    //TODO: implement initialState;
    Home_State get initialState => InitState();
  
   @override
   Stream<Home_State> mapEventToState(Home_events event) async*{

     if (event is IsEmailChanged){
       yield currentState.copyWith(
         email: event.email, 
         isemailvalid: this.validateEmail(event.email));
       print(event.email);
     }
      if (event is IsPasswordChanged){
        yield currentState.copyWith(
          password: event.password,
          ispasswordvalid: this.validatePassword(event.password));
       print(event.password);
      }

      if (event is LoginButtonPressed) {
        print(currentState.iseverythingvalid);
        yield LoginLoading();
        await new Future.delayed(const Duration(seconds : 2));
        if(currentState.iseverythingvalid){
        print("oi");
          try {
          //await new Future.delayed(const Duration(seconds : 2));
          //currentState.iseverythingvalid;
         // yield InitState();
          } catch (error) {
            yield LoginFailure(loginerror: 'Erro!');
          }
        }
      }
    }

  bool validateEmail(String email){
    if(email.contains('@'))
    return true;
    else 
    return false;
  }

  bool validatePassword(String password){
    if(password.length > 4)
    return true;
    else
    return false;
    }
 }