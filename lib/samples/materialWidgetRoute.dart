import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

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
class InputWidgetDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _InputWidgetDemo();
  }
}

class _InputWidgetDemo extends State<InputWidgetDemo> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();

  GlobalKey _formKey = new GlobalKey<FormState>();
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  void fetchRemote() async {
    var url = 'https://api-qa.ywtinfo.com/v2';
    // var httpClient = new HttpClient();
    // debugDumpApp();
    try {
      // var request = await httpClient.postUrl(
      //   new Uri.https(url, '/v2/account/wxapp/doctor/login', {"code": "011FUtwX0ZJVLU1vgrvX0uqJwX0FUtwo", "appId": "ywt-thnetdoc-weapp"})
      // );
      // var response = await request.close();
      // if (response.statusCode == HttpStatus.OK) {
      //   var json = await response.transform(utf8.decoder).join();
      //   var data = jsonDecode(json);
      //   print(data);
      //   // result = data['origin'];
      // } else {
      //   debugPrint('Http status $response');
       
      // }
      Response response;
      Dio dio = new Dio();
      dio.options.baseUrl = url;
      dio.options.headers = {
        HttpHeaders.contentTypeHeader: "application/json;charset=UTF-8",
        HttpHeaders.authorizationHeader: "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcHBpZCI6Inl3dC10aG5ldGRvYy13ZWFwcCIsImF1dGhkYXRhIjoie1widW5pb25JZFwiOlwib21MU1V3ZEhMUDdOUFlXd01ZanZTTDd5OUJ4c1wiLFwib3BlbklkXCI6XCJva2tUWDVaZFVjUGc4Q0FtWU53aGY1c3dveWFJXCIsXCJ1c2VySWRcIjo4fSIsImlhdCI6MTU1OTcyMjE3NX0.LhSvXVF7hohRr_DSbS26ZbrVBkiXhCUyvT40ObW1hRs",
      };
      response = await dio.post("/account/doctor");
      print('fetch result ${response.data}');

    } catch (exception) {
      debugPrint('Http error $exception');
    }
  }

  @override
  void initState() {
    super.initState();
    _unameController.addListener(() {
      final text = _unameController.text;
      print("_unameController: $text");
      _unameController.value = _unameController.value.copyWith(
        text: text,
        // selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        // composing: TextRange.empty,
      );
    });

    focusNode1.addListener(() {
      print("focusNode1 ${focusNode1.hasFocus}");
    });

    focusNode2.addListener(() {
      print("focusNode2 ${focusNode2.hasFocus}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(bottom: 10),
          child: Form(
            key: _formKey,
            autovalidate: true,
            child: Column(
              children: <Widget>[
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "用户名或邮箱",
                  ),
                  controller: _unameController,
                  validator: (val) {
                    return val.trim().length > 0 ? null : "用户名不能为空";
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "您的登录密码",
                  ),
                  obscureText: true,
                  // onChanged: (val) {
                  //   print("onChange: $val");
                  // },
                  controller: _pwdController,
                  validator: (val) {
                    return val.trim().length > 5 ? null : "密码不能少于6位";
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          padding: EdgeInsets.all(15.0),
                          child: Text("登录"),
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          onPressed: () {
                            final flag = (_formKey.currentState as FormState).validate();
                            print(flag);
                            if (flag) {
                              fetchRemote();
                            }
                            // print(Form.of(context).validate());
                          },
                        )
                      )
                    ],
                  )
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 10),
          child: Column(
            children: <Widget>[
              TextField(
                autofocus: true,
                focusNode: focusNode1, // 关联focusNode1
                decoration: InputDecoration(
                  labelText: "input1",
                ),
              ),
              TextField(
                focusNode: focusNode2, // 关联focusNode2
                decoration: InputDecoration(
                  labelText: "input2",
                ),
              ),
              Builder(builder: (ctx) {
                return Column(
                  children: <Widget>[
                    RaisedButton(
                      child: Text("移动焦点"),
                      onPressed: () {
                        //将焦点从第一个TextField移到第二个TextField
                        // 这是一种写法 FocusScope.of(context).requestFocus(focusNode2);
                        // 这是第二种写法
                        if (null == focusScopeNode) {
                          focusScopeNode = FocusScope.of(context);
                        }
                        focusScopeNode.requestFocus(focusNode2);
                      },
                    ),
                    RaisedButton(
                      child: Text("隐藏键盘"),
                      onPressed: () {
                        // 当所有编辑框都失去焦点时键盘就会收起
                        focusNode1.unfocus();
                        focusNode2.unfocus();
                      },
                    ),
                  ],
                );
              },
              ),
            ],
          )
        ),
        Container(
          padding: EdgeInsets.only(bottom: 10),
          child: Theme(
            data: Theme.of(context).copyWith(
              hintColor: Colors.blueGrey,
              inputDecorationTheme: InputDecorationTheme(
                labelStyle: TextStyle(color: Colors.grey),
                hintStyle: TextStyle(color: Colors.grey, fontSize: 20.0),
              ),
            ),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    labelText: "修改样式1",
                    hintText: "placeholder",
                  ),
                ),
              ],
            ),
          )
        )
      ],
    );
  }
}


