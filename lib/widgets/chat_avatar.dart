import 'package:flutter/material.dart';

const _colors = [
  Colors.red,
  Colors.green,
  Colors.purple,
  Colors.yellow,
  Colors.blue,
];

class ChatAvatar extends StatelessWidget {
  final String title;

  const ChatAvatar({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = _colors[title.codeUnitAt(0) % _colors.length];

    final l = color.computeLuminance();

    return Container(
      width: 40,
      height: 40,
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
