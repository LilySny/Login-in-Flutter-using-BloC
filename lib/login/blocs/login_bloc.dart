import 'package:login_app/shared/models/login_dto.dart';
import 'package:login_app/shared/models/user.dart';
import 'package:login_app/shared/repositories/iuser_repository.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc {
  final IUserRepository _userRepository;
  final _password$ = BehaviorSubject<String>();
  final _email$ = BehaviorSubject<String>();
  final _kill$ = PublishSubject();
  Observable<User> currentUser;

  LoginBloc(this._userRepository) {

    currentUser = Observable.zip2(_email$, _password$, (e, p) => LoginDto(e, p))
        .asyncMap(_userRepository.login)
        .asyncMap((s) => _userRepository.findUser())
        .takeUntil(_kill$);
  }

  emailEvent(String s) {
    _email$.add(s);
  }

  password(String p) {
    _password$.add(p);
  }

  void dispose() {
    _email$.close();
    _password$.close();
    _kill$.close();
  }
}
