import'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import '../bloc/HomeBloc.dart';
import '../bloc/Home_events.dart';
import '../bloc/Home_State.dart';

class HomeWidget extends StatefulWidget{
  @override
  HomeWidgetState createState() => HomeWidgetState();
}

class HomeWidgetState extends State<HomeWidget>{

  final HomeBloc bloc = HomeBloc();

   Widget _submitButton(bool isEverythingValid){
     return Padding(
       padding: const EdgeInsets.all(20.0),
       child: RaisedButton(
         color: Colors.blue,
         child: Text("Entrar"),
         textColor: Colors.white,
         shape: StadiumBorder(),
         clipBehavior: Clip.antiAlias,
         onPressed: () => isEverythingValid ? bloc.dispatch(LoginButtonPressed(email: bloc.currentState.email, password: bloc.currentState.password ) ) : null,//CircularProgressIndicator() //(isEverythingValid ? CircularProgressIndicator(): null),
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

  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
      ),
      body: BlocBuilder(
              bloc: bloc,
              builder: (BuildContext context, Home_State state) {
              return ListView(
              children: <Widget>[
              _emailField(bloc,state.isemailvalid),
              _passwordField(bloc,state.ispasswordvalid),
              _submitButton(bloc.currentState.iseverythingvalid),
              ],
              );
              },
              ),
              );
  }

}