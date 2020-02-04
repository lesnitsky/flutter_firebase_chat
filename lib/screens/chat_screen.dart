import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat/containers/messages_container.dart';
import 'package:flutter_firebase_chat/entities/chat.dart';
import 'package:flutter_firebase_chat/entities/messages_state.dart';
import 'package:flutter_firebase_chat/widgets/message_list.dart';

class ChatScreen extends StatefulWidget {
  final Chat chat;

  const ChatScreen({Key key, this.chat}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController controller = new TextEditingController();
  FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.chat.title)),
      body: Column(
        children: <Widget>[
          Expanded(
            child: MessagesContainer(
              chatId: widget.chat.id,
              builder: (context) => MessageList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextField(
                      controller: controller,
                      textInputAction: TextInputAction.newline,
                      decoration:
                          InputDecoration(hintText: 'Write your message...'),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () async {
                    if (controller.text.length > 0) {
                      final text = controller.text;
                      controller.clear();
                      await MessagesStateProvider.of(context)
                          .send(context, text, widget.chat.id);
                    }
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
