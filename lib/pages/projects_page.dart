import 'package:bk1031_dev/utils/theme.dart';
import 'package:bk1031_dev/widgets/navbar.dart';
import 'package:flutter/material.dart';

class ProjectsPage extends StatefulWidget {
  @override
  _ProjectsPageState createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > 650) {
      return new Title(
        title: "Bharat Kathi – Projects",
        color: currTextColor,
        child: Scaffold(
          backgroundColor: currBackgroundColor,
          body: new SingleChildScrollView(
            child: new Column(
              children: <Widget>[
                NavBar()
              ],
            ),
          ),
        ),
      );
    }
    else return Scaffold();
  }
}
