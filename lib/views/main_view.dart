import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart' show EvaIcons;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:join_party/models/profile_model.dart';
import 'package:join_party/models/sql/repository_service.dart';
import 'package:join_party/models/user_model.dart';
import 'package:join_party/views/auth_modules/login_view.dart';
import 'package:join_party/views/chats_modules/new_chat_view.dart';
import 'package:join_party/views/profile_modules/settings_view.dart';
import 'profile_modules/profile_view.dart';
import 'chats_modules/chats_list_view.dart';
import 'map_modules/map_view.dart';
import 'events_modules/events_list_view.dart';
import 'events_modules/event_create_view.dart';
import '../models/colors.dart';
import 'map_modules/search_view.dart';

class MainPage extends StatefulWidget {
  final User profile;
  MainPage({this.profile});

  @override
  _MainPageState createState() => _MainPageState();
}

final MapPage mapPage = MapPage();
final EventsPage eventsPage = EventsPage();
final ChatsPage chatsPage = ChatsPage();
final ProfilePage profilePage = ProfilePage();

BottomIcons bottomIcons = BottomIcons.Map;
enum States { map, events, chats, profile }

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  int menuDuration = 125;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      Center(child: mapPage),
      Center(child: eventsPage),
      Center(child: chatsPage),
      Center(child: profilePage),
    ];
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Offstage(
            child: tabs[0],
            offstage: currentIndex != 0,
          ),
          Offstage(
            child: tabs[1],
            offstage: currentIndex != 1,
          ),
          Offstage(
            child: tabs[2],
            offstage: currentIndex != 2,
          ),
          Offstage(
            child: tabs[3],
            offstage: currentIndex != 3,
          ),
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
                      ? SizedBox(
                          width: 44,
                          child: Icon(
                            EvaIcons.funnelOutline,
                            color: Colors.blueGrey,
                            size: 25,
                          ),
                        )
                      : bottomIcons == BottomIcons.Events
                          ? Container(width: 44)
                          : bottomIcons == BottomIcons.Chats
                              ? IconButton(
                                  iconSize: 25,
                                  icon: Icon(EvaIcons.plusOutline),
                                  color: Colors.blueGrey,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => NewChatScreen(),
                                      ),
                                    );
                                  },
                                )
                              : Container(width: 44),
                  Text(
                    bottomIcons == BottomIcons.Map
                        ? "Join Party"
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
                      ? SizedBox(
                          width: 44,
                          child: IconButton(
                            iconSize: 25,
                            icon: Icon(EvaIcons.searchOutline),
                            color: Colors.blueGrey,
                            onPressed: () {
                              showSearch(
                                  context: context, delegate: SearchData());
                            },
                          ),
                        )
                      : bottomIcons == BottomIcons.Events
                          ? SizedBox(
                              width: 44,
                              child: IconButton(
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
                              ),
                            )
                          : bottomIcons == BottomIcons.Chats
                              ? SizedBox(
                                  width: 44,
                                  child: Icon(EvaIcons.searchOutline,
                                      color: Colors.blueGrey),
                                )
                              : SizedBox(
                                  width: 44,
                                  child: IconButton(
                                    iconSize: 25,
                                    icon: Icon(EvaIcons.moreVerticalOutline),
                                    color: Colors.blueGrey,
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => SettingsView(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
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
                        currentIndex = 0;
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
                        currentIndex = 1;
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
                        currentIndex = 2;
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
                        currentIndex = 3;
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
