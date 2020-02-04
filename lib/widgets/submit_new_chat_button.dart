import 'package:flutter/material.dart';

class SubmitNewChatButton extends StatefulWidget {
  final TextEditingController controller;

  const SubmitNewChatButton({Key key, this.controller}) : super(key: key);

  @override
  _SubmitNewChatButtonState createState() => _SubmitNewChatButtonState();
}

class _SubmitNewChatButtonState extends State<SubmitNewChatButton> {
  bool disabled = false;

  @override
  void initState() {
    widget.controller.addListener(_onTextChanged);
    super.initState();
  }

  _onTextChanged() {
    if (widget.controller.text.length > 0 && disabled) {
      setState(() {
        disabled = false;
      });
    } else if (widget.controller.text.length == 0) {
      setState(() {
        disabled = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      textColor: Colors.blue,
      onPressed: disabled ? null : () {},
      child: Text('Create'),
    );
  }
}
