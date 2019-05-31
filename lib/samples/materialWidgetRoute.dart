import 'package:flutter/material.dart';

class MaterialWidgetRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Material Widget"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              SwitchAndCheckBox(),
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
              )
            ],
          ),
        ),
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right:10),
        
      ),
    );
  }
}

// checkbox and switch ---- start
class SwitchAndCheckBox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SwitchAndCheckboxState();
  }
}

class _SwitchAndCheckboxState extends State<SwitchAndCheckBox> {
  bool _switchSelected = true; // 维护单选开关状态
  bool _checkboxSelected = true; // 维护复选框状态
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Switch(
          value: _switchSelected,
          onChanged: (value) {
            setState(() {
             _switchSelected = value; 
            });
          },
        ),
        Checkbox(
          value: _checkboxSelected,
          activeColor: Colors.red, // 选中时的颜色
          onChanged: (value) {
            setState(() {
              _checkboxSelected = value;
            });
          },
        )
      ],
    );
  }
}

// checkbox and switch ---- end



