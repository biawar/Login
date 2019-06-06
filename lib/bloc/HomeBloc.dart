 import 'package:rxdart/rxdart.dart';
 import '../home/HomeWidget.dart';
 import 'package:firebase_auth/firebase_auth.dart';
 import 'Home_events.dart';
 import 'Home_State.dart';
 import 'package:bloc/bloc.dart';
 import 'package:flutter_bloc/flutter_bloc.dart';
 import 'dart:async';
 import 'dart:math';
 import 'package:cloud_firestore/cloud_firestore.dart';
 

 class HomeBloc extends Bloc<Home_events, Home_State> {
   @override
    //TODO: implement initialState;
    Home_State get initialState => InitState();

    final CollectionReference collectionReference= Firestore.instance.collection("meusPedidos");
  
   @override
   Stream<Home_State> mapEventToState(Home_events event) async*{
     int numero;
     FirebaseUser user;

     if (event is IsEmailChanged){
       yield currentState.copyWith(
         email: event.email, 
         isemailtouched: true,
         isemailvalid: this.validateEmail(event.email));  
       print(event.email);
     }
      if (event is IsPasswordChanged){
        yield currentState.copyWith(
          password: event.password,
          ispasswordtouched: true,
          ispasswordvalid: this.validatePassword(event.password)); 
       print(event.password);
      }

      if (event is IsTitleTextChanged){
        yield currentState.copyWith(
          titleText: event.titleText,
          istitletexttouched: true,
          istitletextvalid: this.validateTitleText(event.titleText)); 
       print(event.titleText);
      }

      if (event is IsDescriptionTextChanged){
        yield currentState.copyWith(
          descriptionText: event.descriptionText,
          isdescriptiontexttouched: true,
          isdescriptiontextvalid: this.validateDescriptionText(event.descriptionText)); 
       print(event.descriptionText);
      }


      if (event is LoginButtonPressed) {
        //print('iseverythingvalid: ${currentState.iseverythingvalid}');
        yield currentState.copyWith(isloading: true);
        await Future.delayed(Duration(seconds:3)); 
        if(currentState.iseverythintouchedandvalid){
          try{
              user= await FirebaseAuth.instance.signInWithEmailAndPassword(email: currentState.email, password: currentState.password);
              //Navigator.pushNamed( context, '/DashboardWidget' );
              yield Success();
            }catch(e){
              print (e.message);
              yield Fail();
            }
          //  yield Success();   
          // }
          // else{
          //   // await Future.delayed(Duration(seconds:3)); 
          //   print(event.numero);
          //   yield Fail();
           } 
        }

      if (event is LogoutButtonPressed){
        yield InitState();
       }

      
       if (event is ButtonCreatePressed){
         yield currentState.copyWith(isloading: true);
         await Future.delayed(Duration(seconds:2));
        if(currentState.iseverythintouchedandvalid){
          try{
            print('oi');
              user= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: currentState.email, 
              password: currentState.password);
              //Navigator.pushNamed( context, '/DashboardWidget' );
              yield Success();
            }catch(e){
              print (e.message);
              yield Fail();
            }
          }
       }


      if (event is AddButtonPressed){
        yield InitState();
      }

      if (event is SendAddButtonPressed){
        yield currentState.copyWith(isloading: true);
        await Future.delayed(Duration(seconds:2));
        if(currentState.istexttouchedandvalid){
        try{
            print("Pedido feito");
              collectionReference.add({"Mesa": currentState.titleText, "Pedido": currentState.descriptionText});
              //Navigator.pushNamed( context, '/DashboardWidget' );
              yield Success();
            }catch(e){
              print (e.message);
              yield Fail();
            }
        }
      }



    }

  // int servidorFake(){
  //   var random = new Random();
  //   int num;
  //   num =  random.nextInt(10);
  //   //await Future.delayed(const Duration(seconds : 2));
  //   return num;
  // }

  bool validateDescriptionText(String descriptionText){
    if(descriptionText != null)
    return true;
    else 
    return false;
  }

  bool validateTitleText(String titleText){
    if(titleText != null)
    return true;
    else 
    return false;
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