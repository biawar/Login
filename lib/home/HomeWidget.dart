import'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  // final FirebaseAuth _firebaseAuth;
  FirebaseUser user;

  // HomeWidgetState({FirebaseAuth firebaseAuth})
  //     : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;


   Widget _submitButton(bool iseverythintouchedandvalid){
     //print('inside submitButton: $isEverythingValid');
     return Padding(
       padding: const EdgeInsets.all(20.0),
       child: RaisedButton(
         color: Colors.blue,
         child: Text("Entrar"),
         textColor: Colors.white,
         shape: StadiumBorder(),
         clipBehavior: Clip.antiAlias,
         onPressed: () async { 
          if(iseverythintouchedandvalid){ 
            print(bloc.currentState.email);
            print(bloc.currentState.password);
            bloc.dispatch(LoginButtonPressed(email: bloc.currentState.email, password: bloc.currentState.password ));
              // try{
              //   user= await FirebaseAuth.instance.signInWithEmailAndPassword(email: bloc.currentState.email, password: bloc.currentState.password);
              //   Navigator.pushNamed( context, '/DashboardWidget' );
              // }catch(e){
              //   print (e.message);
              // }
            }
          }
       )
     );
   }

  Widget _emailField(HomeBloc bloc, bool validemail){
    //print('inside emailField: $validemail');
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        //onChanged: bloc.,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "example@email.com",
          labelText: "Email",
          icon: Icon(Icons.email) ,
          errorText: validemail ? null: 'Email Inválido',
        ),
        onChanged:(String email) => bloc.dispatch(IsEmailChanged(email:email)),
      ),
    );
  }

  
Widget _passwordField(HomeBloc bloc, bool validpassword){
    //print('inside passwordField: $validpassword');
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        obscureText: true,
        //onChanged: (String password) => bloc.dispatch(IsPasswordChanged(password)),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "password",
          labelText: "Password",
          icon: Icon(Icons.lock) ,
          errorText: validpassword ? null: 'Senha Inválida'
        ),
         onChanged:(String password) => bloc.dispatch(IsPasswordChanged(password:password)),
      ),
    );
  }

Widget _createAnAccount(){
  return FlatButton(
      child: Text('Create an Account',),
      onPressed: () {
        Navigator.pushNamed( context, '/createACountWidget' );
        });
}

Widget _loading(){
    return Column(
        children: <Widget>[
          Padding(padding: const EdgeInsets.all(8.0)),
          CircularProgressIndicator(),
        ],  );
  }


  Widget build (BuildContext context){

    // Widget loadingIndicator =_load? new Container(
    //   color: Colors.grey[300],
    //   width: 70.0,
    //   height: 70.0,
    //   child: new Padding(padding: const EdgeInsets.all(5.0),child: new Center(child: new CircularProgressIndicator())),
    // ):new Container();
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
        automaticallyImplyLeading: false,
      ),
    
      body:BlocListener(
        bloc: bloc,
        listener: (context, state) async { 

            if(state is Success) {
                  Padding(padding: const EdgeInsets.all(50.0));
                  CircularProgressIndicator();  
                //print("oi");
                //await Future.delayed(Duration(seconds:3)); 
                Navigator.pushNamed( context, '/DashboardWidget' );            
              }
            if (state is Fail) {
                print(state);
              }

          }, 
        child:BlocBuilder(
        bloc: bloc,
        builder: (BuildContext context, Home_State state) {
        return ListView(
        children: <Widget>[
          _emailField(bloc, state.isemailvalid),
          _passwordField(bloc, state.ispasswordvalid),
          _submitButton(bloc.currentState.iseverythintouchedandvalid),
          _createAnAccount(),
          state.isloading ? _loading() : Padding(padding: EdgeInsets.all(10.0),),
          state is Fail ? Center(child:Text('Usuário e senha inválidos',
          style: TextStyle(fontWeight: FontWeight.bold,
          color: Colors.grey[850].withOpacity(0.8)),
          )): Padding(padding: EdgeInsets.all(10.0),),
          //_loading(),
        ],

        );
        },
        ),
        ),
        );
  }


// Future<void> signInWithCredentials(String email, String password) {
//   return _firebaseAuth.signInWithEmailAndPassword(
//     email: email,
//     password: password,
//     );
//   }

  @override
  void dispose(){
    bloc.dispose();
    super.dispose();
  }

}

