import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

BottomIcons bottomIcons = BottomIcons.Map;

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).padding.top + 50,
            padding: EdgeInsets.only(
                left: 23, right: 24, top: MediaQuery.of(context).padding.top),
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
            child: Align(
              child: Text(
                bottomIcons == BottomIcons.Map
                    ? "Map"
                    : bottomIcons == BottomIcons.Events
                        ? "Events"
                        : bottomIcons == BottomIcons.Chats
                            ? "Chats"
                            : "Profile",
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          bottomIcons == BottomIcons.Map
              ? Center(child: Text("Map"))
              : Container(),
          bottomIcons == BottomIcons.Events
              ? Center(child: Text("Event"))
              : Container(),
          bottomIcons == BottomIcons.Chats
              ? Center(child: Text("Chats"))
              : Container(),
          bottomIcons == BottomIcons.Profile
              ? Center(child: Text("Profile"))
              : Container(),
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
                              color: Colors.orange[100].withOpacity(0.8),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.only(
                                left: 16, right: 16, top: 8, bottom: 8),
                            child: Row(
                              children: <Widget>[
                                Icon(EvaIcons.globe3, color: Colors.orange),
                                SizedBox(width: 8),
                                Text(
                                  "Map",
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          )
                        : Icon(EvaIcons.globe3),
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
                              color: Colors.orange[100].withOpacity(0.8),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.only(
                                left: 16, right: 16, top: 8, bottom: 8),
                            child: Row(
                              children: <Widget>[
                                Icon(EvaIcons.calendarOutline,
                                    color: Colors.orange),
                                SizedBox(width: 8),
                                Text(
                                  "Events",
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          )
                        : Icon(EvaIcons.calendarOutline),
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
                              color: Colors.orange[100].withOpacity(0.8),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.only(
                                left: 16, right: 16, top: 8, bottom: 8),
                            child: Row(
                              children: <Widget>[
                                Icon(EvaIcons.emailOutline,
                                    color: Colors.orange),
                                SizedBox(width: 8),
                                Text(
                                  "Chats",
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          )
                        : Icon(EvaIcons.emailOutline),
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
                              color: Colors.orange[100].withOpacity(0.8),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.only(
                                left: 16, right: 16, top: 8, bottom: 8),
                            child: Row(
                              children: <Widget>[
                                Icon(EvaIcons.personOutline,
                                    color: Colors.orange),
                                SizedBox(width: 8),
                                Text(
                                  "Profile",
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          )
                        : Icon(EvaIcons.personOutline),
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
