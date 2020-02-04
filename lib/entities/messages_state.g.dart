// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_state.dart';

// **************************************************************************
// InheritedGenerator
// **************************************************************************

class MessagesStateProvider extends InheritedWidget {
  MessagesStateProvider(
      {Key key,
      @required this.messages,
      @required this.onMessagesChanged,
      @required this.model,
      Widget child})
      : super(key: key, child: child);

  final List<Message> messages;

  final Function(List<Message>) onMessagesChanged;

  final MessagesState model;

  static MessagesState _oldModel;

  MessagesState get oldModel => MessagesStateProvider._oldModel;
  @override
  updateShouldNotify(MessagesStateProvider oldWidget) {
    final shouldNotify = oldWidget.messages != messages;

    if (shouldNotify) {
      _oldModel = oldWidget.model;
    }

    return shouldNotify;
  }

  static MessagesStateProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MessagesStateProvider>();
  }

  setMessages(List<Message> newMessages) {
    onMessagesChanged(newMessages);
  }
}

class MessagesStateBuilder extends StatefulWidget {
  MessagesStateBuilder(
      {Key key, @required this.messages, this.builder, this.child})
      : super(key: key);

  final List<Message> messages;

  final Widget child;

  final Widget Function(BuildContext, MessagesStateProvider) builder;

  @override
  _MessagesStateBuilderState createState() {
    return _MessagesStateBuilderState();
  }
}

class _MessagesStateBuilderState extends State<MessagesStateBuilder> {
  List<Message> messages;

  @override
  initState() {
    messages = widget.messages;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = MessagesState(messages: messages);

    return MessagesStateProvider(
        model: model,
        child: widget.builder != null
            ? Builder(
                builder: (context) =>
                    widget.builder(context, MessagesStateProvider.of(context)))
            : widget.child,
        messages: messages,
        onMessagesChanged: (newValue) {
          setState(() {
            messages = newValue;
          });
        });
  }

  @override
  didUpdateWidget(Widget oldWidget) {
    messages = widget.messages;

    super.didUpdateWidget(oldWidget);
  }
}
