import 'package:login_app/shared/models/user.dart';
import 'package:rxdart/rxdart.dart';

class AuthenticationBloc {

  static AuthenticationBloc _instance;

  final user$ = BehaviorSubject<User>();
  final exit$ = BehaviorSubject<User>();
  ValueConnectableObservable<User> authUser;


  AuthenticationBloc._internal() {
    authUser = user$.mergeWith([exit$]).publishValue()..connect();
  }

  static AuthenticationBloc getInstance() {
    _instance ??= AuthenticationBloc._internal();
    return _instance;
  }

  userEvent(User u) {
    user$.add(u);
  }

  exit() {
    exit$.add(null);
  }
}

