import 'package:bk1031_dev/pages/bio_page.dart';
import 'package:bk1031_dev/pages/home_page.dart';
import 'package:bk1031_dev/pages/projects_page.dart';
import 'package:bk1031_dev/utils/config.dart';
import 'package:bk1031_dev/utils/theme.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

void main() {

  router.define('/', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new HomePage();
  }));

  router.define('/bio', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new BioPage();
  }));

  router.define('/projects', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new ProjectsPage();
  }));

  runApp(new MaterialApp(
    home: new HomePage(),
    title: "Bharat Kathi",
    theme: mainTheme,
    debugShowCheckedModeBanner: false,
    onGenerateRoute: router.generator,
  ));
}