import 'package:flutter/material.dart';

class AssetRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assets route'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Image(
              image: AssetImage('assets/images/562944_scr10_a.jpg'),
              width: double.infinity,
              repeat: ImageRepeat.noRepeat,
              fit: BoxFit.fitWidth, 
            ),
            Image(
              image: NetworkImage('http://desk.fd.zol-img.com.cn/t_s1920x1080/g5/M00/01/0E/ChMkJ1bKwf2ID3CrAAKwa8-JKRcAALGhAHdZPQAArCD997.jpg'),
              width: double.infinity,
              repeat: ImageRepeat.noRepeat,
              fit: BoxFit.fitWidth, 
            ),
            Icon(IconData(0xe73d, fontFamily: 'myIcon',  matchTextDirection: true ), color: Colors.blue),
          ],
        ),
      )
    );
  }
}