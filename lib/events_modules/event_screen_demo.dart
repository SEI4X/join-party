import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:join_party/models/colors.dart';
import '../models/events_model.dart';

class EventScreenDemo extends StatefulWidget {
  final Event event;
  EventScreenDemo({this.event});

  @override
  _EventScreenDemoState createState() => _EventScreenDemoState();
}

class _EventScreenDemoState extends State<EventScreenDemo> {
  Widget headerImage() {
    return widget.event.imageUrl == null
        ? ClipPath(
            clipper: MyClipper(),
            child: Image(
              image: AssetImage(widget.event.imageUrl),
              width: MediaQuery.of(context).size.width,
              height: 280,
              fit: BoxFit.cover,
            ),
          )
        : Container(height: MediaQuery.of(context).padding.top);
  }

  Widget mainBlock() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[350],
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          headerImage(),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width - 30),
              child: Text(
                widget.event.name,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blueGrey[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.only(top: 8, left: 20, right: 20),
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width - 30),
              child: Text(
                widget.event.place,
                style: TextStyle(
                    fontSize: 16,
                    color: myColors[widget.event.colorScheme],
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.only(top: 8, left: 20, right: 20, bottom: 20),
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width - 30),
              child: Text(
                "${widget.event.date} ${widget.event.time}",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.blueGrey[700],
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buttonsBlock() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: (MediaQuery.of(context).size.width / 3) - 14,
            margin: EdgeInsets.only(top: 15, bottom: 10, left: 10, right: 10),
            height: 50,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Join Party",
                style: TextStyle(
                  color: myColors[widget.event.colorScheme],
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(14)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[350],
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
          ),
          Container(
            width: (MediaQuery.of(context).size.width / 3) - 14,
            margin: EdgeInsets.only(top: 15, bottom: 10, right: 10),
            height: 50,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    widget.event.members.length.toString(),
                    style: TextStyle(
                        color: myColors[widget.event.colorScheme],
                        fontWeight: FontWeight.w700,
                        fontSize: 17),
                  ),
                  Text(
                    "Members",
                    style: TextStyle(
                        color: Colors.blueGrey[700],
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(14)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[350],
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
          ),
          Container(
            width: (MediaQuery.of(context).size.width / 3) - 14,
            height: 50,
            margin: EdgeInsets.only(top: 15, bottom: 10, right: 10),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Share",
                style: TextStyle(
                  color: Colors.blueGrey[700],
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(14)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[350],
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget chatButton() {
    return Container(
      child: Container(
        width: (MediaQuery.of(context).size.width) - 14,
        margin: EdgeInsets.only(top: 5, bottom: 10, left: 10, right: 10),
        height: 50,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            "Chat just for members",
            style: TextStyle(
              color: myColors[widget.event.colorScheme],
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(14)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[350],
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
      ),
    );
  }

  Widget aboutContainer() {
    return Container(
      child: Container(
        constraints: BoxConstraints(minHeight: 50),
        width: (MediaQuery.of(context).size.width) - 14,
        margin: EdgeInsets.only(top: 5, bottom: 10, left: 10, right: 10),
        padding: EdgeInsets.only(top: 8, left: 15, bottom: 15, right: 15),
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 5),
                width: (MediaQuery.of(context).size.width) - 14,
                child: Text(
                  "About",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.blueGrey[700],
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
              Text(
                (widget.event.description == null)
                    ? "No description"
                    : widget.event.description,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.blueGrey[700],
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(14)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[350],
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
      ),
    );
  }

  Widget organizerContainer() {
    return Container(
      child: Container(
        constraints: BoxConstraints(minHeight: 50),
        width: (MediaQuery.of(context).size.width) - 14,
        margin: EdgeInsets.only(top: 5, bottom: 10, left: 10, right: 10),
        padding: EdgeInsets.only(top: 8, left: 15, bottom: 15, right: 15),
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 5),
                width: (MediaQuery.of(context).size.width) - 14,
                child: Text(
                  "Organizer",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.blueGrey[700],
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Container(
                          width: 77,
                          height: 77,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[350],
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(38)),
                            color: myColors[widget.event.colorScheme],
                          ),
                        ),
                        CircleAvatar(
                          radius: 35.0,
                          backgroundImage:
                              AssetImage(widget.event.creator.imageUrl),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width - 150,
                            child: Text(
                              widget.event.creator.firstName,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.blueGrey[700],
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: MediaQuery.of(context).size.width - 150,
                            child: Text(
                              "Moscow, Russia",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.blueGrey[700],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              width: MediaQuery.of(context).size.width - 150,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(right: 5),
                                    height: 30,
                                    width: 30,
                                    child: Image(
                                      image: AssetImage(
                                          "assets/images/vk-logo.png"),
                                      color: myColors[widget.event.colorScheme],
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(16)),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    height: 30,
                                    width: 30,
                                    child: Image(
                                      image: AssetImage(
                                          "assets/images/telegram-logo.png"),
                                      color: myColors[widget.event.colorScheme],
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(16)),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    height: 30,
                                    width: 30,
                                    child: Image(
                                      image: AssetImage(
                                          "assets/images/inst-logo.png"),
                                      color: myColors[widget.event.colorScheme],
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(16)),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    height: 30,
                                    width: 30,
                                    child: Image(
                                      image: AssetImage(
                                          "assets/images/tiktok-logo.png"),
                                      color: myColors[widget.event.colorScheme],
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(16)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(14)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[350],
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 800,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom + 30),
        physics: ClampingScrollPhysics(),
        dragStartBehavior: DragStartBehavior.down,
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
          color: Color(0xffefefef),
          child: Container(
            child: Column(
              children: <Widget>[
                mainBlock(),
                buttonsBlock(),
                chatButton(),
                aboutContainer(),
                organizerContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
      0,
      size.height - 50,
      size.width / 5,
      size.height - 50,
    );
    path.lineTo(size.width - (size.width / 5), size.height - 50);
    path.quadraticBezierTo(
      size.width,
      size.height - 50,
      size.width,
      size.height - 100,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
