// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// InheritedGenerator
// **************************************************************************

class UserProvider extends InheritedWidget {
  UserProvider(
      {Key key,
      @required this.name,
      @required this.id,
      @required this.onNameChanged,
      @required this.onIdChanged,
      @required this.model,
      Widget child})
      : super(key: key, child: child);

  final String name;

  final String id;

  final Function(String) onNameChanged;

  final Function(String) onIdChanged;

  final User model;

  static User _oldModel;

  User get oldModel => UserProvider._oldModel;
  @override
  updateShouldNotify(UserProvider oldWidget) {
    final shouldNotify = oldWidget.name != name || oldWidget.id != id;

    if (shouldNotify) {
      _oldModel = oldWidget.model;
    }

    return shouldNotify;
  }

  static UserProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserProvider>();
  }

  setName(String newName) {
    onNameChanged(newName);
  }

  setId(String newId) {
    onIdChanged(newId);
  }
}

class UserBuilder extends StatefulWidget {
  UserBuilder(
      {Key key,
      @required this.name,
      @required this.id,
      this.builder,
      this.child})
      : super(key: key);

  final String name;

  final String id;

  final Widget child;

  final Widget Function(BuildContext, UserProvider) builder;

  @override
  _UserBuilderState createState() {
    return _UserBuilderState();
  }
}

class _UserBuilderState extends State<UserBuilder> {
  String name;

  String id;

  @override
  initState() {
    name = widget.name;
    id = widget.id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = User(name: name, id: id);

    return UserProvider(
        model: model,
        child: widget.builder != null
            ? Builder(
                builder: (context) =>
                    widget.builder(context, UserProvider.of(context)))
            : widget.child,
        name: name,
        id: id,
        onNameChanged: (newValue) {
          setState(() {
            name = newValue;
          });
        },
        onIdChanged: (newValue) {
          setState(() {
            id = newValue;
          });
        });
  }

  @override
  didUpdateWidget(Widget oldWidget) {
    name = widget.name;
    id = widget.id;

    super.didUpdateWidget(oldWidget);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
    };
