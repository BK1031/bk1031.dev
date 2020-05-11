import 'package:bk1031_dev/utils/theme.dart';
import 'package:bk1031_dev/widgets/navbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > 650) {
      return Scaffold(
        backgroundColor: currBackgroundColor,
        body: new SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              NavBar(),
              new Container(
                padding: EdgeInsets.all(100),
                child: Column(
                  children: <Widget>[
                    new Text(
                      "Hey there, I'm Bharat!",
                      style: TextStyle(color: currTextColor, fontSize: 75, fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.all(8)),
                    new Text(
                      "Web Developer",
                      style: TextStyle(color: currDividerColor, fontSize: 65, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }
    else return Scaffold();
  }
}
