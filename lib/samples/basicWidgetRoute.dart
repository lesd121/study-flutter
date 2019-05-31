import 'package:flutter/widgets.dart';

class BasicWidgetRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Center(
            child: Text("Hello world! I'm Jack. " * 4,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18.0,
                decoration: TextDecoration.none,
                height: 1.2,
                color: Color.fromRGBO(0, 0, 0, 1),
              ),
            ),
          ),
          Center(
            child: Text.rich(TextSpan(
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 0.6),
                fontSize: 16.0,
                height: 1.5,
              ),
              children: [
                TextSpan(
                  text: "Home: ",
                ),
                TextSpan(
                  text: "https://flutterchina.club",
                  style: TextStyle(
                    color: Color.fromRGBO(124,208,255, 1),
                  ),
                ),
              ]
            )),
          ),
          DefaultTextStyle(
            style: TextStyle(
              color: Color.fromRGBO(243,177,58, 1),
              fontSize: 18.0,
              height: 1.2,
            ),
            textAlign: TextAlign.start,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("hello world"),
                Text("I am Jack"),
                Text("I am Jack",
                  style: TextStyle(
                    inherit: false,
                    color: Color.fromRGBO(0, 0, 0, 0.6),
                  ),
                ),
              ],
            ),
          ),
          Image(
            image: AssetImage('assets/images/b_6_large.jpg'),
            width: double.infinity,
            repeat: ImageRepeat.noRepeat,
            fit: BoxFit.fitWidth, 
          ),
          Image(
            image: AssetImage('assets/images/b_6_large.jpg'),
            width: double.infinity,
            repeat: ImageRepeat.noRepeat,
            fit: BoxFit.fitWidth, 
            color: Color.fromRGBO(255,255,255, 1),
            colorBlendMode: BlendMode.difference,
          ),
        ],
      ),
      color: Color.fromRGBO(255, 255, 255, 1),
      padding: EdgeInsets.only(top: 10, right: 10, bottom: 10, left: 10),
      margin: EdgeInsets.only(top: 24.0),
    );
  }
}
