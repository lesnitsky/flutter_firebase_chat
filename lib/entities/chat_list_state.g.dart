// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_list_state.dart';

// **************************************************************************
// InheritedGenerator
// **************************************************************************

class ChatListStateProvider extends InheritedWidget {
  ChatListStateProvider(
      {Key key,
      @required this.chats,
      @required this.onChatsChanged,
      @required this.model,
      Widget child})
      : super(key: key, child: child);

  final List<Chat> chats;

  final Function(List<Chat>) onChatsChanged;

  final ChatListState model;

  static ChatListState _oldModel;

  ChatListState get oldModel => ChatListStateProvider._oldModel;
  @override
  updateShouldNotify(ChatListStateProvider oldWidget) {
    final shouldNotify = oldWidget.chats != chats;

    if (shouldNotify) {
      _oldModel = oldWidget.model;
    }

    return shouldNotify;
  }

  static ChatListStateProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ChatListStateProvider>();
  }

  setChats(List<Chat> newChats) {
    onChatsChanged(newChats);
  }
}

class ChatListStateBuilder extends StatefulWidget {
  ChatListStateBuilder(
      {Key key, @required this.chats, this.builder, this.child})
      : super(key: key);

  final List<Chat> chats;

  final Widget child;

  final Widget Function(BuildContext, ChatListStateProvider) builder;

  @override
  _ChatListStateBuilderState createState() {
    return _ChatListStateBuilderState();
  }
}

class _ChatListStateBuilderState extends State<ChatListStateBuilder> {
  List<Chat> chats;

  @override
  initState() {
    chats = widget.chats;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = ChatListState(chats: chats);

    return ChatListStateProvider(
        model: model,
        child: widget.builder != null
            ? Builder(
                builder: (context) =>
                    widget.builder(context, ChatListStateProvider.of(context)))
            : widget.child,
        chats: chats,
        onChatsChanged: (newValue) {
          setState(() {
            chats = newValue;
          });
        });
  }

  @override
  didUpdateWidget(Widget oldWidget) {
    chats = widget.chats;

    super.didUpdateWidget(oldWidget);
  }
}
