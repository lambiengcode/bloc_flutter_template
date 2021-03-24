import 'package:flutter/material.dart';
import 'package:flutter_bloc_provider/src/bloc/bloc.dart';

class NameProvider with ChangeNotifier {
  String _firstName = "First";
  String _lastName = "Last";
  NameBloc _bloc;

  NameProvider() {
    _bloc = NameBloc();
  }

  String get firstName => _firstName;
  String get lastName => _lastName;
  NameBloc get bloc => _bloc;

  void setFirstName(String firstName) {
    _firstName = firstName;
    notifyListeners();
  }

  void setLastName(String lastName) {
    _lastName = lastName;
    notifyListeners();
  }
}
