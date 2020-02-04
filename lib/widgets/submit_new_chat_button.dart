import 'package:flutter/material.dart';

class SubmitNewChatButton extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onSubmitted;

  const SubmitNewChatButton({Key key, this.controller, this.onSubmitted})
      : super(key: key);

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
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      textColor: Colors.blue,
      onPressed: disabled ? null : widget.onSubmitted,
      child: Text('Create'),
    );
  }
}
