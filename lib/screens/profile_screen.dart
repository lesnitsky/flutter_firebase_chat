import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_firebase_chat/entities/user.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController;

  @override
  void initState() {
    nameController = new TextEditingController();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      nameController.text = UserProvider.of(context).name;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = UserProvider.of(context);

    if (userProvider == null) {
      return Container();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
              onSubmitted: (newName) {
                if (newName == '') {
                  return;
                }

                UserProvider.of(context).setName(newName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
