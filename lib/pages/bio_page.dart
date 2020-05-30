import 'dart:html' as html;
import 'package:bk1031_dev/utils/theme.dart';
import 'package:bk1031_dev/widgets/navbar.dart';
import 'package:flutter/material.dart';

class BioPage extends StatefulWidget {
  @override
  _BioPageState createState() => _BioPageState();
}

class _BioPageState extends State<BioPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > 650) {
      return new Title(
        title: "Bharat Kathi – Bio",
        color: currTextColor,
        child: Scaffold(
          backgroundColor: currBackgroundColor,
          body: new Column(
            children: <Widget>[
              NavBar(),
              new SingleChildScrollView(
                child: new Column(

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
