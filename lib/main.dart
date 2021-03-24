import 'package:flutter/material.dart';
import 'package:flutter_bloc_provider/src/providers/name_provider.dart';
import 'package:flutter_bloc_provider/src/screens/welcome.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => NameProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bloc Provider',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: WelcomePage(),
      ),
    );
  }
}
