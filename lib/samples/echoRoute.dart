import 'package:flutter/material.dart';

class EchoRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //获取路由参数
    var args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("New route with params"),
      ),
      body: Center(
        child: Text(args),
      ),
    );
  }
}