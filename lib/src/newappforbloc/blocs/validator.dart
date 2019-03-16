import 'dart:async';

class Validator {
  final performEmailValidation =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    String emailValidationRule =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(emailValidationRule);
    if (regex.hasMatch(email)) {
      print('email matched');
      sink.add(email);
    } else {
      print('email not validated. error');
      sink.addError('Please enter a valid email address');
    }
  });

  final performPasswordValidation = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    String passwordRule = '((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#%]).{6,10})';
    RegExp regex = RegExp(passwordRule);
    if (regex.hasMatch(password)) {
      sink.add(password);
    } else {
      sink.addError(
          'Password contain one digit, one lowercase, one uppercase, one special symbol "@#%" and be min. 6 to max. 10 characters long');
    }
  });
}
