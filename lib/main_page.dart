import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart' show EvaIcons;
import 'package:join_party/profile%20modules/profile_page.dart';
import 'chats_modules/chats_page.dart';
import 'map_modules/map_page.dart';
import 'events_modules/events_page.dart';
import 'events_modules/event_create_page.dart';
import 'models/colors.dart';

import 'package:join_party/map_modules/search_bar.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

enum States { map, events, chats, profile }

BottomIcons bottomIcons = BottomIcons.Map;

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  static final tabs = [
    Center(child: MapPage()),
    Center(child: EventsPage()),
    Center(child: ChatsPage()),
    Center(child: ProfilePage()),
  ];

  int menuDuration = 125;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          tabs[0],
          bottomIcons == BottomIcons.Events ? tabs[1] : Container(),
          bottomIcons == BottomIcons.Chats ? tabs[2] : Container(),
          bottomIcons == BottomIcons.Profile ? tabs[3] : Container(),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).padding.top + 40,
              padding: EdgeInsets.only(
                  left: 24, right: 24, top: MediaQuery.of(context).padding.top),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: myShadows[6],
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  bottomIcons == BottomIcons.Map
                      ? Icon(
                          EvaIcons.funnelOutline,
                          color: Colors.blueGrey,
                          size: 25,
                        )
                      : bottomIcons == BottomIcons.Events
                          ? Container(width: 30)
                          : bottomIcons == BottomIcons.Chats
                              ? Icon(EvaIcons.plusCircleOutline,
                                  color: Colors.blueGrey)
                              : Container(width: 30),
                  Text(
                    bottomIcons == BottomIcons.Map
                        ? "Map"
                        : bottomIcons == BottomIcons.Events
                            ? "My events"
                            : bottomIcons == BottomIcons.Chats
                                ? "Chats"
                                : "Profile",
                    style: TextStyle(
                      color: bottomIcons == BottomIcons.Map
                          ? Colors.lightBlueAccent[400]
                          : bottomIcons == BottomIcons.Events
                              ? Colors.pink[400]
                              : bottomIcons == BottomIcons.Chats
                                  ? Colors.orange
                                  : Colors.tealAccent[700],
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  bottomIcons == BottomIcons.Map
                      ? IconButton(
                          iconSize: 25,
                          icon: Icon(EvaIcons.searchOutline),
                          color: Colors.blueGrey,
                          onPressed: () {
                            showSearch(
                                context: context, delegate: SearchData());
                          },
                        )
                      : bottomIcons == BottomIcons.Events
                          ? IconButton(
                              iconSize: 25,
                              icon: Icon(EvaIcons.plus),
                              color: Colors.blueGrey,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => EventCreatePage()),
                                );
                                setState(() {});
                              },
                            )
                          : bottomIcons == BottomIcons.Chats
                              ? Icon(EvaIcons.searchOutline,
                                  color: Colors.blueGrey)
                              : Icon(EvaIcons.moreVerticalOutline,
                                  color: Colors.blueGrey),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 1.05),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).padding.bottom + 70,
              padding: EdgeInsets.only(
                  left: 23,
                  right: 24,
                  bottom: MediaQuery.of(context).padding.bottom + 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: myShadows[6],
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // Карта
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          bottomIcons = BottomIcons.Map;
                        });
                      },
                      child: AnimatedContainer(
                        decoration: BoxDecoration(
                          color: bottomIcons == BottomIcons.Map
                              ? Colors.lightBlueAccent[100].withOpacity(0.4)
                              : Colors.lightBlueAccent[100].withOpacity(0.0),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.only(
                            left: 16, right: 16, top: 8, bottom: 8),
                        duration: Duration(milliseconds: menuDuration),
                        child: Row(
                          children: <Widget>[
                            Icon(EvaIcons.globe3,
                                color: bottomIcons == BottomIcons.Map
                                    ? Colors.lightBlueAccent[400]
                                    : Colors.lightBlueAccent),
                            AnimatedSize(
                              duration: Duration(milliseconds: menuDuration),
                              curve: Curves.easeInOut,
                              vsync: this,
                              child: Text(
                                bottomIcons == BottomIcons.Map ? "  Map" : "",
                                style: TextStyle(
                                    color: Colors.lightBlueAccent[400],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            )
                          ],
                        ),
                      )),
                  // События
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          bottomIcons = BottomIcons.Events;
                        });
                      },
                      child: AnimatedContainer(
                        decoration: BoxDecoration(
                          color: bottomIcons == BottomIcons.Events
                              ? Colors.pink[100].withOpacity(0.4)
                              : Colors.pink[100].withOpacity(0.0),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.only(
                            left: 16, right: 16, top: 8, bottom: 8),
                        duration: Duration(milliseconds: menuDuration),
                        child: Row(
                          children: <Widget>[
                            Icon(EvaIcons.calendarOutline,
                                color: bottomIcons == BottomIcons.Events
                                    ? Colors.pink
                                    : Colors.pink[400]),
                            AnimatedSize(
                              duration: Duration(milliseconds: menuDuration),
                              curve: Curves.easeInOut,
                              vsync: this,
                              child: Text(
                                bottomIcons == BottomIcons.Events
                                    ? "  My events"
                                    : "",
                                style: TextStyle(
                                    color: Colors.pink[400],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            )
                          ],
                        ),
                      )),
                  // Чаты
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          bottomIcons = BottomIcons.Chats;
                        });
                      },
                      child: AnimatedContainer(
                        decoration: BoxDecoration(
                          color: bottomIcons == BottomIcons.Chats
                              ? Colors.orange[100].withOpacity(0.4)
                              : Colors.orange[100].withOpacity(0.0),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.only(
                            left: 16, right: 16, top: 8, bottom: 8),
                        duration: Duration(milliseconds: menuDuration),
                        child: Row(
                          children: <Widget>[
                            Icon(EvaIcons.emailOutline,
                                color: bottomIcons == BottomIcons.Chats
                                    ? Colors.orange
                                    : Colors.orange[400]),
                            AnimatedSize(
                              duration: Duration(milliseconds: menuDuration),
                              curve: Curves.easeInOut,
                              vsync: this,
                              child: Text(
                                bottomIcons == BottomIcons.Chats
                                    ? "  Chats"
                                    : "",
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            )
                          ],
                        ),
                      )),
                  // Профиль
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          bottomIcons = BottomIcons.Profile;
                        });
                      },
                      child: AnimatedContainer(
                        decoration: BoxDecoration(
                          color: bottomIcons == BottomIcons.Profile
                              ? Colors.tealAccent.withOpacity(0.4)
                              : Colors.tealAccent.withOpacity(0.0),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.only(
                            left: 16, right: 16, top: 8, bottom: 8),
                        duration: Duration(milliseconds: menuDuration),
                        child: Row(
                          children: <Widget>[
                            Icon(EvaIcons.personOutline,
                                color: bottomIcons == BottomIcons.Profile
                                    ? Colors.tealAccent[700]
                                    : Colors.tealAccent[700]),
                            AnimatedSize(
                              duration: Duration(milliseconds: menuDuration),
                              curve: Curves.easeInOut,
                              vsync: this,
                              child: Text(
                                bottomIcons == BottomIcons.Profile
                                    ? "  Profile"
                                    : "",
                                style: TextStyle(
                                    color: Colors.tealAccent[700],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

enum BottomIcons { Map, Events, Chats, Profile }
