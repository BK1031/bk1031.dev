import 'package:bk1031_dev/utils/theme.dart';
import 'package:bk1031_dev/widgets/navbar.dart';
import 'package:flutter/material.dart';

class BioPage extends StatefulWidget {
  @override
  _BioPageState createState() => _BioPageState();
}

class _BioPageState extends State<BioPage> {
  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > 650) {
      return Scaffold(
        backgroundColor: currBackgroundColor,
        body: new SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              NavBar()
            ],
          ),
        ),
      );
    }
    else return Scaffold();
  }
}
