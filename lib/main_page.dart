import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart' show EvaIcons;
import 'chats_modules/chats_page.dart';
import 'package:join_party/map_modules/search_bar.dart';
import 'map_modules/map_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

BottomIcons bottomIcons = BottomIcons.Map;

class _MainPageState extends State<MainPage> {
  static final tabs = [
    Center(child: MapPage()),
    Center(child: Text("Events")),
    Center(child: ChatsPage()),
    Center(child: Text("Profile")),
  ];

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
                    color: Colors.black26,
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  bottomIcons == BottomIcons.Map
                      ? Icon(EvaIcons.funnelOutline, color: Colors.blueGrey)
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
                            ? "Events"
                            : bottomIcons == BottomIcons.Chats
                                ? "Chats"
                                : "Profile",
                    style: TextStyle(
                      color: Colors.lightBlueAccent[400],
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  bottomIcons == BottomIcons.Map
                      ? IconButton(
                          icon: Icon(EvaIcons.searchOutline),
                          color: Colors.blueGrey,
                          onPressed: () {
                            showSearch(
                                context: context, delegate: SearchData());
                          },
                        )
                      : bottomIcons == BottomIcons.Events
                          ? Container(width: 30)
                          : bottomIcons == BottomIcons.Chats
                              ? Icon(EvaIcons.searchOutline,
                                  color: Colors.blueGrey)
                              : Container(width: 30),
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
                    color: Colors.black26,
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 0), // changes position of shadow
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
                    child: bottomIcons == BottomIcons.Map
                        ? Container(
                            decoration: BoxDecoration(
                              color:
                                  Colors.lightBlueAccent[100].withOpacity(0.4),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.only(
                                left: 16, right: 16, top: 8, bottom: 8),
                            child: Row(
                              children: <Widget>[
                                Icon(EvaIcons.globe3,
                                    color: Colors.lightBlueAccent[400]),
                                SizedBox(width: 8),
                                Text(
                                  "Map",
                                  style: TextStyle(
                                      color: Colors.lightBlueAccent[400],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          )
                        : Icon(
                            EvaIcons.globe3,
                            color: Colors.blueGrey,
                          ),
                  ),
                  // События
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bottomIcons = BottomIcons.Events;
                      });
                    },
                    child: bottomIcons == BottomIcons.Events
                        ? Container(
                            decoration: BoxDecoration(
                              color:
                                  Colors.lightBlueAccent[100].withOpacity(0.5),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.only(
                                left: 16, right: 16, top: 8, bottom: 8),
                            child: Row(
                              children: <Widget>[
                                Icon(EvaIcons.calendarOutline,
                                    color: Colors.lightBlueAccent[400]),
                                SizedBox(width: 8),
                                Text(
                                  "Events",
                                  style: TextStyle(
                                      color: Colors.lightBlueAccent[400],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          )
                        : Icon(EvaIcons.calendarOutline,
                            color: Colors.blueGrey),
                  ),
                  // Чаты
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bottomIcons = BottomIcons.Chats;
                      });
                    },
                    child: bottomIcons == BottomIcons.Chats
                        ? Container(
                            decoration: BoxDecoration(
                              color:
                                  Colors.lightBlueAccent[100].withOpacity(0.5),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.only(
                                left: 16, right: 16, top: 8, bottom: 8),
                            child: Row(
                              children: <Widget>[
                                Icon(EvaIcons.emailOutline,
                                    color: Colors.lightBlueAccent[400]),
                                SizedBox(width: 8),
                                Text(
                                  "Chats",
                                  style: TextStyle(
                                      color: Colors.lightBlueAccent[400],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          )
                        : Icon(
                            EvaIcons.emailOutline,
                            color: Colors.blueGrey,
                          ),
                  ),
                  // Профиль
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bottomIcons = BottomIcons.Profile;
                      });
                    },
                    child: bottomIcons == BottomIcons.Profile
                        ? Container(
                            decoration: BoxDecoration(
                              color:
                                  Colors.lightBlueAccent[100].withOpacity(0.5),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.only(
                                left: 16, right: 16, top: 8, bottom: 8),
                            child: Row(
                              children: <Widget>[
                                Icon(EvaIcons.personOutline,
                                    color: Colors.lightBlueAccent[400]),
                                SizedBox(width: 8),
                                Text(
                                  "Profile",
                                  style: TextStyle(
                                      color: Colors.lightBlueAccent[400],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          )
                        : Icon(
                            EvaIcons.personOutline,
                            color: Colors.blueGrey,
                          ),
                  ),
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
