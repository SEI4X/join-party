import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:join_party/models/events_model.dart';
import 'package:join_party/models/message_model.dart';
import 'package:join_party/models/profile_model.dart';
import 'package:join_party/models/sql/repository_awards.dart';
import 'package:join_party/models/sql/repository_reviews.dart';
import 'package:join_party/models/sql/repository_users.dart';
import 'package:join_party/models/sql/repository_friends.dart';
import 'package:join_party/models/user_model.dart';
import 'package:join_party/views/profile_modules/add_review_view.dart';
import 'package:join_party/views/profile_modules/all_events_screen.dart';
import 'friend_list_view.dart';
import 'review_list_view.dart';
import 'package:join_party/models/colors.dart';
import 'awards_list_screen.dart';

String review = 'Reviews (' + profile.review.length.toString() + ')';
String userName = "${profile.user.name} ${profile.user.secondName}";
final blocks = [
  Center(child: FriendListScreen(profile: profile)),
];

class ProfilePage extends StatefulWidget {
  final Profile profile;

  ProfilePage({this.profile});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final StreamController _profileController = StreamController();
  Stream get profileController => _profileController.stream;

  Stream<Profile> profileView(Duration refreshTime) async* {
    while (true) {
      await Future.delayed(refreshTime);
      yield await getProfileForStream(currentUser.id);
    }
  }

  @override
  void dispose() {
    _profileController.close();
    super.dispose();
  }

  Widget blockInfo(String topText, String bottomText, BuildContext context,
      Widget screen, Profile profile) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => screen,
        ),
      ),
      child: Container(
          width: MediaQuery.of(context).size.width / 3 - 16,
          padding: EdgeInsets.fromLTRB(5, 6, 5, 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(16)),
            boxShadow: [
              BoxShadow(
                color: myShadows[6],
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              Text(
                topText,
                style: TextStyle(
                  color: myColors[profile.user.colorScheme],
                  fontSize: 16.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                bottomText,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14.2,
                ),
              ),
            ],
          )),
    );
  }

  Widget userInfo(BuildContext context, Profile profile) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          children: [
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
                              color: myShadows[6],
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(38)),
                          color: myColors[profile.user.colorScheme],
                        ),
                      ),
                      CircleAvatar(
                        radius: 35.0,
                        backgroundImage: NetworkImage(profile.user.imageUrl),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width - 150,
                          child: Text(
                            "${profile.user.name} ${profile.user.secondName}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.blueGrey[700],
                            ),
                          ),
                        ),
                        Container(
                          height: 25,
                          width: MediaQuery.of(context).size.width - 150,
                          child: Text(
                            "${profile.user.city}, ${profile.user.country}",
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
                                  margin: EdgeInsets.only(right: 8),
                                  height: 30,
                                  width: 30,
                                  child: Image(
                                    image:
                                        AssetImage("assets/images/vk-logo.png"),
                                    color: myColors[profile.user.colorScheme],
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 8),
                                  height: 30,
                                  width: 30,
                                  child: Image(
                                    image: AssetImage(
                                        "assets/images/telegram-logo.png"),
                                    color: myColors[profile.user.colorScheme],
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 8),
                                  height: 30,
                                  width: 30,
                                  child: Image(
                                    image: AssetImage(
                                        "assets/images/inst-logo.png"),
                                    color: myColors[profile.user.colorScheme],
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 8),
                                  height: 30,
                                  width: 30,
                                  child: Image(
                                    image: AssetImage(
                                        "assets/images/tiktok-logo.png"),
                                    color: myColors[profile.user.colorScheme],
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
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: EdgeInsets.only(top: 10, bottom: 5, right: 10),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 2),
                      width: double.infinity,
                      child: Text(
                        'About',
                        style: TextStyle(
                          color: Colors.blueGrey[700],
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: Text(
                        profile.user.about,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.blueGrey[700],
                          fontSize: 16.0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget blockReview(Review review, BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 76,
                    height: 76,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(38)),
                      color: Color(0xffffffff),
                    ),
                  ),
                  CircleAvatar(
                    radius: 35.0,
                    backgroundImage: NetworkImage(review.user.imageUrl),
                  )
                ],
              ),
              SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "${review.user.name} ${review.user.secondName}",
                    style: TextStyle(
                      color: myColors[review.user.colorScheme],
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Text(
                      review.text,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: 50,
            child: Text(
              review.date,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: myColors[review.user.colorScheme],
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget addReviewButton(BuildContext context, Profile profile) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => NewReview(profile: profile)),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 48,
        margin: EdgeInsets.only(top: 12, left: 12, right: 12),
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.all(Radius.circular(15)),
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
          alignment: Alignment.center,
          child: Text(
            "Add new review",
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget addToFriendButton(BuildContext context) {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 48,
        margin: EdgeInsets.only(top: 12, left: 12, right: 12),
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.all(Radius.circular(15)),
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
          alignment: Alignment.center,
          child: Text(
            "Follow",
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Profile>(
        stream: profileView(Duration(seconds: 3)),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              decoration: BoxDecoration(gradient: myGradients[6]),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(
                        10,
                        MediaQuery.of(context).padding.top.toDouble() + 50,
                        10,
                        15),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: userInfo(context, snapshot.data),
                  ),
                  Container(
                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          blockInfo(
                              snapshot.data.awards.length.toString(),
                              'Awards',
                              context,
                              AwardListScreen(profile: snapshot.data),
                              snapshot.data),
                          blockInfo(
                              snapshot.data.friends.length.toString(),
                              'Friends',
                              context,
                              FriendListScreen(profile: snapshot.data),
                              snapshot.data),
                          blockInfo(
                              snapshot.data.events.length.toString(),
                              'Events',
                              context,
                              AllEventsPage(profile: snapshot.data),
                              snapshot.data),
                        ],
                      )),
                  addToFriendButton(context),
                  addReviewButton(context, snapshot.data),
                  Container(
                      height: 60,
                      width: double.infinity,
                      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                                "Reviews (${snapshot.data.review.length.toString()})",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                )),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    ReviewListScreen(profile: snapshot.data),
                              ),
                            ),
                            child: Container(
                              child: Text('View all',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17,
                                    color: myColors[
                                        snapshot.data.user.colorScheme],
                                  )),
                            ),
                          ),
                        ],
                      )),
                  snapshot.data.review.length >= 1
                      ? blockReview(snapshot.data.review[0], context)
                      : Container(),
                  snapshot.data.review.length > 1
                      ? blockReview(snapshot.data.review[1], context)
                      : Container(),
                ],
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
