import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with Validators {
  final _emailConttler = BehaviorSubject<String>();
  final _passwordConttler = BehaviorSubject<String>();

  // Add data to stream
  Stream<String> get email => _emailConttler.stream.transform(validateEmail);
  Stream<String> get password =>
      _passwordConttler.stream.transform(validatePassword);
  Stream<bool> get submitValue =>
      Rx.combineLatest2(email, password, (e, p) => true);

  // Change data
  Function(String) get changeEmail => _emailConttler.sink.add;
  Function(String) get changePassword => _passwordConttler.sink.add;

  submit() {
    final validEmail = _emailConttler.value;
    final validPassword = _passwordConttler.value;

    print('Email is $validEmail');
    print('Password is $validPassword');
  }

  void dispose() {
    _emailConttler.close();
    _passwordConttler.close();
  }
}
