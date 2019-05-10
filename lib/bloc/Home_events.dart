import 'package:equatable/equatable.dart';

abstract class Home_events extends Equatable{

Home_events([List properties = const []]):super(properties);

}

class IsEmailChanged extends Home_events{
  final String email;
  IsEmailChanged(
    this.email
  ):super([email]);
  @override
  String toString() => "IsEmailChanged";
}

class IsPasswordChanged extends Home_events{
  final String password;
  IsPasswordChanged(
    this.password
  ):super([password]);
  @override
  String toString() => "IsPasswordChanged";
}

class SubmitPressed extends Home_events{
}

