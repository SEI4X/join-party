import 'dart:ui';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:join_party/models/colors.dart';
import 'package:join_party/models/events_model.dart';
import '../../models/user_model.dart';

class MembersListScreen extends StatefulWidget {
  final Event event;
  MembersListScreen({this.event});

  @override
  _MembersListScreen createState() => _MembersListScreen();
}

class _MembersListScreen extends State<MembersListScreen> {
  memberBlock(User member) {
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
                          backgroundImage: AssetImage(member.imageUrl),
                        )
                      ],
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width - 150,
                            child: Text(
                              "${member.name} ${member.secondName}",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: myColors[member.colorScheme],
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: MediaQuery.of(context).size.width - 150,
                            child: Text(
                              "${member.city} ${member.country}",
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
    return Container(
      decoration: BoxDecoration(gradient: myGradients[6]),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: myColors[widget.event.colorScheme], //change your color here
          ),
          title: Center(
            child: Text(
              "Members",
              style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700]),
            ),
          ),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(EvaIcons.searchOutline),
              iconSize: 30.0,
              color: myColors[widget.event.colorScheme],
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: ClipRRect(
            child: ListView.builder(
              itemCount: widget.event.members.length,
              itemBuilder: (BuildContext context, int index) {
                final User member = widget.event.members[index];
                return memberBlock(member);
              },
            ),
          ),
        ),
      ),
    );
  }
}
