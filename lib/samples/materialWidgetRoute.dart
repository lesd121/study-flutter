import 'package:flutter/material.dart';

class MaterialWidgetRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Material Widget"),
      ),
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.all(10.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(<Widget>[
                Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        SwitchAndCheckBox(),
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                        ),
                        InputWidgetDemo(),
                      ],
                    ),
                  ),
                ),
              ]),
            )
          )
        ],
      )
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

// form and input ---- start
class InputWidgetDemo extends StatelessWidget {
  final TextEditingController _unameController = new TextEditingController();
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  InputWidgetDemo() {
    _unameController.addListener(() {
      print("_unameController: ${_unameController.text}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          // padding: EdgeInsets.only(bottom: 10),
          child: Column(
            children: <Widget>[
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                ),
                controller: _unameController,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "您的登录密码",
                ),
                obscureText: true,
                onChanged: (val) {
                  print("onChange: $val");
                },
              ),
              FlatButton(
                textColor: Colors.white,
                color: Colors.lightBlue,
                highlightColor: Colors.blue,
                child: Text("测试"),
                onPressed: () {
                  print(_unameController.text);
                },
              )
            ],
          ),
        ),
        Container(
          child: Column(
            children: <Widget>[
              TextField(
                autofocus: true,
                focusNode: focusNode1, // 关联focusNode1
                decoration: InputDecoration(
                  labelText: "input1",
                ),
              )
            ],
          )
        ),
      ],
    );
  }
}


