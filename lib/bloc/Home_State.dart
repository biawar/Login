import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Home_State extends Equatable{

final String password;
final String email;
final bool isemailvalid;
final bool ispasswordvalid;
final bool isloginsubmited;

bool get iseverythingvalid => isemailvalid && ispasswordvalid;

Home_State({
  this.password,
  this.email,
  this.isemailvalid,
  this.ispasswordvalid,
  this.isloginsubmited,
}):super ([password, email, isemailvalid, ispasswordvalid,isloginsubmited]);

Home_State copyWith ({
  String password,
  String email,
  bool isemailvalid,
  bool ispasswordvalid,
  bool isloginsubmited}){
return Home_State(
  password: password ?? this.password,
  email: email ?? this.email,
  isemailvalid: isemailvalid ?? this.isemailvalid,
  ispasswordvalid: ispasswordvalid ?? this.ispasswordvalid,
  isloginsubmited: isloginsubmited ?? this.isloginsubmited);
  }
}

class Success extends Home_State {
  @override
  String toString() => 'Success: Usuario e senha validos';
}

class Fail extends Home_State{
  @override
  String toString() => 'Fail: Usuario e senha invalidos';
}

//class LoginFailure extends Home_State {
  //final String loginerror;
 
  //LoginFailure({@required this.loginerror}) : super(loginerror: loginerror);

  //@override
  //String toString() => 'LoginFailure { error: $loginerror }';
//}

class InitState extends Home_State{
  InitState():super(
    password: "",
    email: "",
    isemailvalid: true,
    ispasswordvalid: true,
    isloginsubmited: false,
  );
}