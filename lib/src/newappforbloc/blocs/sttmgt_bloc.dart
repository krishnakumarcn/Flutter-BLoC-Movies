import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:bloc_eg/src/newappforbloc/blocs/validator.dart';

class SttMgmtBloc extends Object with Validator {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get emailStream =>
      _emailController.stream.transform(performEmailValidation);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(performPasswordValidation);

  Stream<bool> get submitValid => Observable.combineLatest2(
      emailStream, passwordStream, (eStream, pStream) => true);

  Function(String) get updateEmail => _emailController.sink.add;
  Function(String) get updatePassword => _passwordController.sink.add;

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
