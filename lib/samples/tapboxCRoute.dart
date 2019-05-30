import 'package:flutter/material.dart';

class TapboxCRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _TapboxCState();
}

class _TapboxCState extends State<TapboxCRoute> {
  bool _active = false;
  
  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapboxCChild(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

class TapboxCChild extends StatefulWidget {
  TapboxCChild({ Key key, this.active, @required this.onChanged }) : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  State<StatefulWidget> createState() => new _TapboxCChildState();
}

class _TapboxCChildState extends State<TapboxCChild> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true; 
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false; 
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: Container(
        child: Center(
          child: Text(
            widget.active ? 'Active' : 'Inactive',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight ? Border.all(
            color: Colors.teal[700],
            width: 10.0,
          ) : null,
        ),
      ),
    );
  }
}

