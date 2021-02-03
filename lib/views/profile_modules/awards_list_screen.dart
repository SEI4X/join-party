import 'dart:ui';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:join_party/models/colors.dart';
import 'package:join_party/models/profile_model.dart';
import '../../models/user_model.dart';

class AwardListScreen extends StatefulWidget {
  final Profile profile;

  AwardListScreen({this.profile});

  @override
  _AwardListScreen createState() => _AwardListScreen();
}

class _AwardListScreen extends State<AwardListScreen> {
  friendBlock(User friend) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(15, 0, 15, 15),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: myShadows[6],
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, 3), // changes position of shadow
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
                            color: Colors.white,
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
                                color: Colors.black,
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
              "Awards",
              style: TextStyle(
                fontSize: 21.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(EvaIcons.searchOutline),
              iconSize: 30.0,
              color: Colors.white,
              onPressed: () {},
            ),
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
