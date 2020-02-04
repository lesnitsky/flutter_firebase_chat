import 'package:flutter/material.dart';

const _colors = [
  Colors.deepOrange,
  Colors.red,
  Colors.green,
  Colors.deepPurple,
  Colors.brown,
  Colors.teal,
  Colors.tealAccent,
];

class ChatAvatar extends StatelessWidget {
  final String title;

  const ChatAvatar({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = _colors[title.codeUnitAt(0) % _colors.length];

    final l = color.computeLuminance();

    return Container(
      width: 46,
      height: 46,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23),
        color: color,
      ),
      child: Center(
        child: Text(
          title[0].toUpperCase(),
          style: TextStyle(color: l > 0.5 ? Colors.black : Colors.white),
        ),
      ),
    );
  }
}
