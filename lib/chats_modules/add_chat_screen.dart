import 'dart:ui';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:join_party/models/colors.dart';
import 'package:join_party/models/profile_model.dart';
import '../models/user_model.dart';
import 'chat_screen.dart';

class AddChatScreen extends StatefulWidget {
  final Profile profile;

  AddChatScreen({this.profile});

  @override
  _AddChatScreen createState() => _AddChatScreen();
}

class _AddChatScreen extends State<AddChatScreen> {
  friendBlock(User friend) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: myShadows[6],
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Align(
            alignment: Alignment.topLeft,
            child: Column(children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Row(children: [
                    Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Container(
                          width: 77,
                          height: 77,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(38)),
                            color: myColors[friend.colorScheme],
                          ),
                        ),
                        CircleAvatar(
                          radius: 35.0,
                          backgroundImage: AssetImage(friend.imageUrl),
                        )
                      ],
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width - 150,
                            child: Text(
                              "${friend.name} ${friend.secondName}",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: myColors[friend.colorScheme],
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: MediaQuery.of(context).size.width - 150,
                            child: Text(
                              "${friend.city} ${friend.country}",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[600],
                              ),
                            ),
                          )
                        ]))
                  ]))
            ])));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: myColors[profile.user.colorScheme],
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.transparent,
          title: Center(
            child: Text(
              "Add Chat",
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          elevation: 0.0,
          actions: <Widget>[
            Container(
              width: 50,
            )
          ],
        ),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(color: Colors.white),
            child: ClipRRect(
                child: ListView.builder(
                    itemCount: profile.friends.length,
                    itemBuilder: (BuildContext context, int index) {
                      final User friend = profile.friends[index];
                      return friendBlock(friend);
                    }))));
  }
}
