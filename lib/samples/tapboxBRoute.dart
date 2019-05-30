import 'package:flutter/material.dart';

// TapboxBRoute 为 TapboxB 管理状态
class TapboxBRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _TapboxBState();
  }
}

class _TapboxBState extends State<TapboxBRoute> {
  bool _active = false;
  void _handleTapboxChanged(bool newValue) {
    setState(() {
     _active = newValue; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapboxB(
        active: _active,
        onChanged: _handleTapboxChanged,
      )
    );
  }
}

class TapboxB extends StatelessWidget {
  TapboxB({Key key, this.active: false, @required this.onChanged})
    : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}