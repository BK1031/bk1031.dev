import 'dart:html' as html;
import 'package:bk1031_dev/utils/config.dart';
import 'package:bk1031_dev/utils/theme.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new Container(
        color: currBackgroundColor,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new FlatButton(
              child: new Text("EQUINOX INITIATIVE", style: TextStyle(color: currBackgroundColor)),
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new FlatButton(
                  child: new Text("HOME", style: TextStyle(color: html.window.location.toString().endsWith("/") ? currTextColor : currDividerColor)),
                  onPressed: () {
                    router.navigateTo(context, "/", transition: TransitionType.fadeIn);
                  },
                ),
                new FlatButton(
                  child: new Text("BIO", style: TextStyle(color: html.window.location.toString().endsWith("/bio") ? currTextColor : currDividerColor)),
                  onPressed: () {
                    router.navigateTo(context, "/bio", transition: TransitionType.fadeIn);
                  },
                ),
                new FlatButton(
                  child: new Text("PROJECTS", style: TextStyle(color: html.window.location.toString().endsWith("/projects") ? currTextColor : currDividerColor)),
                  onPressed: () {
                    router.navigateTo(context, "/projects", transition: TransitionType.fadeIn);
                  },
                ),
              ],
            ),
            new FlatButton(
              child: new Text("EQUINOX INITIATIVE", style: TextStyle(color: html.window.location.toString().endsWith("/equinox") ? currTextColor : currDividerColor)),
              onPressed: () {
                html.window.location.assign("https://equinox.bk1031.dev");
              },
            )
          ],
        ),
      )
    );
  }
}
