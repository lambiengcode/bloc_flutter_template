import 'package:flutter/material.dart';
import 'package:flutter_bloc_provider/src/screens/settings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/name_provider.dart';

class WelcomePage extends StatefulWidget {
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<NameProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          InkWell(
            child: Icon(Icons.settings),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SettingsPage(),
                ),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(40.0),
        child: Column(
          children: <Widget>[
            Text(
              'Welcome',
              style: GoogleFonts.lakkiReddy(
                fontSize: 40.0,
                textStyle: TextStyle(color: Colors.black),
              ),
            ),
            Text(
              providerData.firstName,
              style: GoogleFonts.lakkiReddy(
                fontSize: 40.0,
                textStyle: TextStyle(color: Colors.black),
              ),
            ),
            Text(
              providerData.lastName,
              style: GoogleFonts.lakkiReddy(
                fontSize: 40.0,
                textStyle: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
