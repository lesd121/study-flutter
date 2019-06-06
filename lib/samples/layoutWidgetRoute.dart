import 'package:flutter/material.dart';

class LayoutWidgetRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("布局样例"),
      ),
      body: Container(
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          // child: ColumnInColumn(),
          // child: RowInColumn(),
          // child: ColumnInRow(),
          // child: ColumnInExpanedColumn(),
          // child: FlexExpanded(),
          child: StackPositioned(),
        ),
      ),
    );
  }
}

// Column in Column
class ColumnInColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
      children: <Widget>[
        Container(
          color: Colors.red,
          child: Column(
            mainAxisSize: MainAxisSize.max, //无效，内层Colum高度为实际高度  
            children: <Widget>[
              Text("hello world"),
              Text("Test1"),
              Text("Test2"),
            ],
          ),
        ),
      ],
    );
  }
}

// Row in Column
class RowInColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          color: Colors.red,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text("hello world"),
              Text("Test1"),
              Text("Test2"),
            ],
          )
        )
      ],
    );
  }
}

// Column in Row
class ColumnInRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          color: Colors.red,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text("hello world"),
              Text("Test1"),
              Text("Test2"),
            ],
          )
        )
      ],
    );
  }
}

// Column in Expanded Column
class ColumnInExpanedColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
      children: <Widget>[
        Expanded(
            child: Container(
            color: Colors.red,
            child: Column(
              mainAxisSize: MainAxisSize.max, //无效，内层Colum高度为实际高度  
              children: <Widget>[
                Text("hello world"),
                Text("Test1"),
                Text("Test2"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// More Flex Expanded
class FlexExpanded extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                height: 30.0,
                color: Colors.red,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 30.0,
                color: Colors.blue,
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: SizedBox(
            height: 100.0,
            // Flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 30.0,
                    color: Colors.red,
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 30.0,
                    color: Colors.yellow,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Stack and Positioned
class StackPositioned extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Stack(
        alignment: Alignment.topLeft,
        // fit: StackFit.expand, //未定位widget占满Stack整个空间
        children: <Widget>[
          Container(
            child: Text("Hello world", style: TextStyle(color: Colors.white)),
            color: Colors.red,
          ),
          Positioned(
            left: 18.0,
            top: 50.0,
            child: Text("Test1"),
          ),
          Positioned(
            right: 18.0,
            top: 18.0,
            child: Text("Test2"),
          ),
        ],
      ),
    );
  }
}