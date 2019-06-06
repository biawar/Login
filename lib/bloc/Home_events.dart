import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class Home_events extends Equatable{

Home_events([List properties = const []]):super(properties);

}

class IsEmailChanged extends Home_events{
  final String email;
  IsEmailChanged({this.email}):super([email]);
  @override
  String toString() => 'IsEmailChanged { email: $email }';
}

 class IsPasswordChanged extends Home_events{
   final String password;
   IsPasswordChanged({this.password}):super([password]);
   @override
   String toString() => 'IsPasswordChanged { password: $password}';
 }
 

class LoginButtonPressed extends Home_events {
  final String email;
  final String password;

  LoginButtonPressed({
    @required this.email,
    @required this.password,
  }) : super([email, password]);

  @override
  String toString() =>
      'LoginButtonPressed { username: $email, password: $password }';
}

// class SubmitPressed extends Home_events{
// }

