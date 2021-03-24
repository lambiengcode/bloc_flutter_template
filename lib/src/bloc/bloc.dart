import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class NameBloc {
  //Declare Streams
  final _firstName = BehaviorSubject<String>();
  final _lastName = BehaviorSubject<String>();

  //Get
  Stream<String> get firstName =>
      _firstName.stream.transform(validateFirstName);
  Stream<String> get lastName => _lastName.stream;
  Stream<bool> get nameValid =>
      Rx.combineLatest2(firstName, lastName, (a, b) => true);

  //Set
  Function(String) get changeFirstName => _firstName.sink.add;
  Function(String) get changeLastName => _lastName.sink.add;

  //Validators
  final validateFirstName =
      StreamTransformer<String, String>.fromHandlers(handleData: (fName, sink) {
    if (fName.length < 3) {
      sink.addError('Minimum 3 characters');
    } else {
      sink.add(fName);
    }
  });

  dispose() {
    _firstName.close();
    _lastName.close();
  }
}
