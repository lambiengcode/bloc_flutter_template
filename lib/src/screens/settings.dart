import 'package:flutter/material.dart';
import 'package:flutter_bloc_provider/src/providers/name_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<NameProvider>(context).bloc;
    final providerData = Provider.of<NameProvider>(context);
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();

    if (providerData.firstName != 'First') {
      firstNameController.text = providerData.firstName;
      bloc.changeLastName(providerData.firstName);
    }

    if (providerData.lastName != 'Last') {
      lastNameController.text = providerData.lastName;
      bloc.changeLastName(providerData.lastName);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            StreamBuilder<String>(
                stream: bloc.firstName,
                builder: (context, snapshot) {
                  return TextField(
                    controller: firstNameController,
                    decoration: InputDecoration(
                        labelText: 'First Name', errorText: snapshot.error),
                    onChanged: bloc.changeFirstName,
                  );
                }),
            StreamBuilder<String>(
                stream: bloc.lastName,
                builder: (context, snapshot) {
                  return TextField(
                    controller: lastNameController,
                    decoration: InputDecoration(labelText: 'Last Name'),
                    onChanged: bloc.changeLastName,
                  );
                }),
            SizedBox(
              height: 10.0,
            ),
            StreamBuilder<bool>(
                stream: bloc.nameValid,
                builder: (context, snapshot) {
                  return RaisedButton(
                    child: Text('Save'),
                    onPressed: !snapshot.hasData
                        ? null
                        : () {
                            providerData.setFirstName(firstNameController.text);
                            providerData.setLastName(lastNameController.text);
                            Navigator.pop(context);
                          },
                  );
                })
          ],
        ),
      ),
    );
  }
}
