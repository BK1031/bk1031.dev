import 'dart:convert';

import 'package:bk1031_dev/widgets/app_drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:html' as html;
import 'package:bk1031_dev/utils/theme.dart';
import 'package:bk1031_dev/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:bk1031_dev/utils/config.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> skillList = ["iOS", "Android", "Web", "MacOS", "Windows", "Linux"];
  int currSkill = 0;

  int discordOnline = 0;

  Timer _timer;

  Future<void> getDiscordOnline() async {
    await http.get("https://discordapp.com/api/guilds/638994107049443349/widget.json").then((response) {
      var responseJson = jsonDecode(response.body);
      setState(() {
        discordOnline = responseJson["presence_count"];
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getDiscordOnline();
    _timer = new Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        if (currSkill + 1 < skillList.length) {
          currSkill += 1;
        }
        else {
          currSkill = 0;
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > 1100) {
      return new Title(
        title: "BK1031",
        color: currTextColor,
        child: Scaffold(
          backgroundColor: currBackgroundColor,
          body: new SingleChildScrollView(
            child: new Column(
              children: <Widget>[
                NavBar(),
                new Container(
                  padding: EdgeInsets.only(top: 100),
                  child: Column(
                    children: <Widget>[
                      new Text(
                        "Hey there, I'm Bharat!",
                        style: TextStyle(color: mainColor, fontSize: 75, fontWeight: FontWeight.bold),
                      ),
                      new Padding(padding: EdgeInsets.all(8)),
                      new Text(
                        "${skillList[currSkill]} Developer",
                        style: TextStyle(color: currDividerColor, fontSize: 65, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
                new Container(
                  padding: EdgeInsets.all(32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new IconButton(
                        icon: new Image.asset(
                          "images/instagram_logo.png",
                          color: Colors.white,
                        ),
                        onPressed: () {
                          html.window.open(igLink, "Instagram");
                        },
                      ),
                      new IconButton(
                        icon: new Image.asset(
                          "images/twitter_logo.png",
                          color: Colors.white,
                        ),
                        onPressed: () {
                          html.window.open(twitterLink, "Twitter");
                        },
                      ),
                      new IconButton(
                        icon: new Image.asset(
                          "images/linked_logo.png",
                          color: Colors.white,
                        ),
                        onPressed: () {
                          html.window.open(linkedLink, "LinkedIn");
                        },
                      ),
                      new IconButton(
                        icon: new Image.asset(
                          "images/youtube_logo.png",
                          color: Colors.white,
                        ),
                        onPressed: () {
                          html.window.open(youtubeLink, "YouTube");
                        },
                      ),
                      new IconButton(
                        icon: new Image.asset(
                          "images/twitch_logo.png",
                          color: Colors.white,
                        ),
                        onPressed: () {
                          html.window.open(twitchLink, "Twitch");
                        },
                      ),
                      new IconButton(
                        icon: new Image.asset(
                          "images/github_logo.png",
                          color: Colors.white,
                        ),
                        color: Colors.white,
                        onPressed: () {
                          html.window.open(githubLink, "GitHub");
                        },
                      )
                    ],
                  ),
                ),
                new Container(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                        color: currCardColor,
                        child: Container(
                          width: 500,
                          padding: EdgeInsets.all(32),
                          child: Row(
                            children: <Widget>[
                              new Icon(
                                Icons.error,
                                size: 100,
                                color: Colors.white,
                              ),
                              new Padding(padding: EdgeInsets.all(12)),
                              new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Text("Something broken?", style: TextStyle(fontSize: 35, color: currTextColor, fontWeight: FontWeight.bold),),
                                  new Padding(padding: EdgeInsets.all(4)),
                                  new Text("🟢 3 Services Online", style: TextStyle(fontSize: 25, color: currDividerColor),),
                                  new Padding(padding: EdgeInsets.all(6)),
                                  new FlatButton(
                                    onPressed: () {
                                      html.window.location.assign("https://status.bk1031.dev");
                                    },
                                    color: mainColor,
                                    child: new Container(
                                      padding: EdgeInsets.only(top: 12, left: 8, right: 8, bottom: 8),
                                      child: new Text("Check Status", style: TextStyle(fontSize: 20, color: Colors.white, fontFamily: "Uni Sans"),),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      new Padding(padding: EdgeInsets.all(16)),
                      new Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                        color: currCardColor,
                        child: Container(
                          width: 500,
                          padding: EdgeInsets.all(32),
                          child: Row(
                            children: <Widget>[
                              new Image.asset(
                                "images/discord_logo.png",
                                color: mainColor,
                                height: 100,
                              ),
                              new Padding(padding: EdgeInsets.all(12)),
                              new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Text("Want to chat?", style: TextStyle(fontSize: 35, color: currTextColor, fontWeight: FontWeight.bold),),
                                  new Padding(padding: EdgeInsets.all(4)),
                                  new Text("🟢 $discordOnline Members Online", style: TextStyle(fontSize: 25, color: currDividerColor),),
                                  new Padding(padding: EdgeInsets.all(6)),
                                  new FlatButton(
//                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                    onPressed: () {
                                      html.window.open("https://discord.bk1031.dev", "BK1031 Playground Discord");
                                    },
                                    color: Color(0xFF7289da),
                                    child: new Container(
                                      padding: EdgeInsets.only(top: 12, left: 8, right: 8, bottom: 8),
                                      child: new Text("Join the Discord", style: TextStyle(fontSize: 20, color: Colors.white, fontFamily: "Uni Sans"),),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
    else return new Title(
      title: "BK1031 Mobile Site",
      color: currTextColor,
      child: Scaffold(
        appBar: new AppBar(
          title: new Text("Home", style: TextStyle(color: Colors.white),),
          iconTheme: new IconThemeData(color: Colors.white),
        ),
        drawer: new AppDrawer(),
        backgroundColor: currBackgroundColor,
        body: new SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              new Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    new Text(
                      "Hey there, I'm Bharat!",
                      style: TextStyle(color: mainColor, fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.all(8)),
                    new Text(
                      "${skillList[currSkill]} Developer",
                      style: TextStyle(color: currDividerColor, fontSize: 35, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              new Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new IconButton(
                      icon: new Image.asset(
                        "images/instagram_logo.png",
                        color: Colors.white,
                      ),
                      onPressed: () {
                        html.window.open(igLink, "Instagram");
                      },
                    ),
                    new IconButton(
                      icon: new Image.asset(
                        "images/twitter_logo.png",
                        color: Colors.white,
                      ),
                      onPressed: () {
                        html.window.open(twitterLink, "Twitter");
                      },
                    ),
                    new IconButton(
                      icon: new Image.asset(
                        "images/linked_logo.png",
                        color: Colors.white,
                      ),
                      onPressed: () {
                        html.window.open(linkedLink, "LinkedIn");
                      },
                    ),
                    new IconButton(
                      icon: new Image.asset(
                        "images/youtube_logo.png",
                        color: Colors.white,
                      ),
                      onPressed: () {
                        html.window.open(youtubeLink, "YouTube");
                      },
                    ),
                    new IconButton(
                      icon: new Image.asset(
                        "images/twitch_logo.png",
                        color: Colors.white,
                      ),
                      onPressed: () {
                        html.window.open(twitchLink, "Twitch");
                      },
                    ),
                    new IconButton(
                      icon: new Image.asset(
                        "images/github_logo.png",
                        color: Colors.white,
                      ),
                      color: Colors.white,
                      onPressed: () {
                        html.window.open(githubLink, "GitHub");
                      },
                    )
                  ],
                ),
              ),
              new Container(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(8),
                      child: new Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                        color: currCardColor,
                        child: Container(
                          padding: EdgeInsets.all(16),
                          child: Row(
                            children: <Widget>[
                              new Icon(
                                Icons.error,
                                size: 75,
                                color: Colors.white,
                              ),
                              new Padding(padding: EdgeInsets.all(8)),
                              new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Text("Something broken?", style: TextStyle(fontSize: 25, color: currTextColor, fontWeight: FontWeight.bold),),
                                  new Padding(padding: EdgeInsets.all(4)),
                                  new Text("🟢 3 Services Online", style: TextStyle(fontSize: 20, color: currDividerColor),),
                                  new Padding(padding: EdgeInsets.all(6)),
                                  new FlatButton(
                                    onPressed: () {
                                      html.window.location.assign("https://status.bk1031.dev");
                                    },
                                    color: mainColor,
                                    child: new Container(
                                      padding: EdgeInsets.only(top: 12, left: 8, right: 8, bottom: 8),
                                      child: new Text("Check Status", style: TextStyle(fontSize: 20, color: Colors.white, fontFamily: "Uni Sans"),),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: new Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                        color: currCardColor,
                        child: Container(
                          padding: EdgeInsets.all(16),
                          child: Row(
                            children: <Widget>[
                              new Image.asset(
                                "images/discord_logo.png",
                                color: mainColor,
                                height: 74,
                              ),
                              new Padding(padding: EdgeInsets.all(8)),
                              new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Text("Want to chat?", style: TextStyle(fontSize: 25, color: currTextColor, fontWeight: FontWeight.bold),),
                                  new Padding(padding: EdgeInsets.all(4)),
                                  new Text("🟢 $discordOnline Members Online", style: TextStyle(fontSize: 20, color: currDividerColor),),
                                  new Padding(padding: EdgeInsets.all(6)),
                                  new FlatButton(
//                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                    onPressed: () {
                                      html.window.open("https://discord.bk1031.dev", "BK1031 Playground Discord");
                                    },
                                    color: Color(0xFF7289da),
                                    child: new Container(
                                      padding: EdgeInsets.only(top: 12, left: 8, right: 8, bottom: 8),
                                      child: new Text("Join the Discord", style: TextStyle(fontSize: 20, color: Colors.white, fontFamily: "Uni Sans"),),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
