import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_firebase_chat/entities/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class UserContainer extends StatefulWidget {
  final Widget child;

  const UserContainer({Key key, this.child}) : super(key: key);
  @override
  _UserContainerState createState() => _UserContainerState();
}

class _UserContainerState extends State<UserContainer> {
  Future<User> userFuture;

  @override
  initState() {
    userFuture = loadUser();

    super.initState();
  }

  Future<User> loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString('user');

    if (userString != null) {
      final data = json.decode(userString);
      final user = User.fromJson(data);

      return user;
    } else {
      final user = User(id: Uuid().v1(), name: 'Unknown User');

      await Firestore.instance
          .collection('users')
          .document(user.id)
          .setData(user.toJson());

      await prefs.setString('user', json.encode(user.toJson()));

      return user;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: userFuture,
      builder: (context, snapshot) => snapshot.hasData
          ? UserBuilder(
              child: UserPersistance(
                child: widget.child,
              ),
              name: snapshot.data.name,
              id: snapshot.data.id,
            )
          : Container(),
    );
  }
}

class UserPersistance extends StatefulWidget {
  final Widget child;

  const UserPersistance({Key key, this.child}) : super(key: key);
  @override
  _UserPersistanceState createState() => _UserPersistanceState();
}

class _UserPersistanceState extends State<UserPersistance> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void didChangeDependencies() {
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      final userProvider = UserProvider.of(context);

      if (userProvider.oldModel?.name != userProvider.model?.name) {
        final user = userProvider.model;
        final prefs = await SharedPreferences.getInstance();

        prefs.setString('user', json.encode(user.toJson()));

        await Firestore.instance
            .collection('users')
            .document(user.id)
            .setData(user.toJson());
      }
    });
    super.didChangeDependencies();
  }
}
