import'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import '../bloc/HomeBloc.dart';
import '../bloc/Home_events.dart';
import '../bloc/Home_State.dart';
import 'dart:math';

class HomeWidget extends StatefulWidget{
  @override
  HomeWidgetState createState() => HomeWidgetState();
}

class HomeWidgetState extends State<HomeWidget>{

  final HomeBloc bloc = HomeBloc();
  final Stream<int> numero;
  

   Widget _submitButton(bool isEverythingValid){
     return Padding(
       padding: const EdgeInsets.all(20.0),
       child: RaisedButton(
         color: Colors.blue,
         child: Text("Entrar"),
         textColor: Colors.white,
         shape: StadiumBorder(),
         clipBehavior: Clip.antiAlias,
         onPressed: () async { 
          if(isEverythingValid){ 
            _loading();
            await Future.delayed(Duration(seconds:1));
            bloc.dispatch(LoginButtonPressed(email: bloc.currentState.email, password: bloc.currentState.password ));
            }
          else 
          null; 
          }
       )
        );
   }

  Widget _emailField(HomeBloc bloc, bool validemail){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        //onChanged: bloc.,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "example@email.com",
          labelText: "Email",
          errorText: validemail ? null: 'Email Inválido',
        ),
        onChanged:(String email) => bloc.dispatch(IsEmailChanged(email:email)),
      ),
    );
  }

  
Widget _passwordField(HomeBloc bloc, bool validpassword){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        obscureText: true,
        //onChanged: (String password) => bloc.dispatch(IsPasswordChanged(password)),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "password",
          labelText: "Password",
          errorText: validpassword ? null: 'Senha Inválida'
        ),
         onChanged:(String password) => bloc.dispatch(IsPasswordChanged(password:password)),
      ),
    );
  }


Widget _loading(){
    return Column(
      children: <Widget>[
        Padding(padding: const EdgeInsets.all(8.0)),
        CircularProgressIndicator(),
      ],
    );
  }


  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
      ),
      body:BlocListener(
        bloc: bloc,
        listener: (context, state) { 
          if (state.isloginsubmited) {
            bloc.servidorFake().listen((x){
              print(x);
              numero = x;
            if(numero%2==0){
              print("Success");
              Navigator.pushNamed( context, '/DashboardWidget' );             
            }
            else {
              print("Fail");
              //bloc.currentState.copyWith(isloginsubmited: false);
              print(bloc.currentState.isloginsubmited);
            }
            });
          }
        }, 
        child:BlocBuilder(
        bloc: bloc,
        builder: (BuildContext context, Home_State state) {
        return ListView(
        children: <Widget>[
        _emailField(bloc,state.isemailvalid),
        _passwordField(bloc,state.ispasswordvalid),
        _submitButton(bloc.currentState.iseverythingvalid),
        //_loading(bloc.currentState.isloginsubmited),
        ],

        );
        },
        ),
        ),
        );
  }

  @override
  void dispose(){
    bloc.dispose();
    super.dispose();
  }

}

