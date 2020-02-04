import 'package:flutter/material.dart';

class SubmitNewChatButton extends StatefulWidget {
  final TextEditingController controller;

  const SubmitNewChatButton({Key key, this.controller}) : super(key: key);

  @override
  _SubmitNewChatButtonState createState() => _SubmitNewChatButtonState();
}

class _SubmitNewChatButtonState extends State<SubmitNewChatButton> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text('Create'),
    );
  }
}
