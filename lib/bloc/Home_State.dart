import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Home_State extends Equatable{

final String password;
final String email;
final bool isemailvalid;
final bool ispasswordvalid;
final String loginerror;

bool get iseverythingvalid => isemailvalid && ispasswordvalid;

Home_State({
  this.password,
  this.email,
  this.isemailvalid,
  this.ispasswordvalid,
  this.loginerror,
}):super ([password, email, isemailvalid, ispasswordvalid,loginerror]);

Home_State copyWith ({
  String password,
  String email,
  bool isemailvalid,
  bool ispasswordvalid,
  String loginerror}){
return Home_State(
  password: password ?? this.password,
  email: email ?? this.email,
  isemailvalid: isemailvalid ?? this.isemailvalid,
  ispasswordvalid: ispasswordvalid ?? this.ispasswordvalid,
  loginerror: loginerror ?? this.loginerror);
  }
}

class LoginLoading extends Home_State {
  @override
  String toString() => 'LoginLoading';
}

class LoginFailure extends Home_State {
  final String loginerror;
 
  LoginFailure({@required this.loginerror}) : super(loginerror: loginerror);

  @override
  String toString() => 'LoginFailure { error: $loginerror }';
}

class InitState extends Home_State{
  InitState():super(
    password: "",
    email: "",
    isemailvalid: true,
    ispasswordvalid: true,
    loginerror: "",
  );
}