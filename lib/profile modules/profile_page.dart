import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:join_party/models/profile_model.dart';
import 'package:join_party/models/events_model.dart';
import 'package:join_party/profile%20modules/friend_list_screen.dart';
import 'package:join_party/profile%20modules/review_list_screen.dart';
import 'package:join_party/models/colors.dart';

String review = 'Reviews (' + profile.review.length.toString() + ')';
String userName = "${profile.user.name} ${profile.user.secondName}";
final blocks = [
  Center(child: FriendListScreen(profile: profile)),
];

class ProfilePage extends StatelessWidget {
  Widget blockInfo(String topText, String bottomText, BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => FriendListScreen(profile: profile),
        ),
      ),
      child: Container(
          width: 110,
          padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              Text(
                topText,
                style: TextStyle(
                  color: eventColors[profile.user.colorScheme],
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                bottomText,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15.0,
                ),
              ),
            ],
          )),
    );
  }

  Widget userInfo(BuildContext context) {
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
                              color: Colors.grey[350],
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(38)),
                          color: myColors[profile.user.colorScheme],
                        ),
                      ),
                      CircleAvatar(
                        radius: 35.0,
                        backgroundImage: AssetImage(profile.user.imageUrl),
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
                            userName,
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
                            "${profile.user.city} ${profile.user.country}",
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
                        profile.about,
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
        gradient: myGradient[review.user.colorScheme],
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: myShadows[review.user.colorScheme],
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2), // changes position of shadow
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
                    backgroundImage: AssetImage(review.user.imageUrl),
                  )
                ],
              ),
              SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    review.user.name,
                    style: TextStyle(
                      color: Colors.white,
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
                        color: Colors.white,
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
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(
            10, MediaQuery.of(context).padding.top.toDouble() + 50, 10, 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: userInfo(context),
      ),
      Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              blockInfo(profile.awards.toString(), 'Awards', context),
              blockInfo(profile.friends.length.toString(), 'Friends', context),
              blockInfo(profile.events.toString(), 'Events', context),
            ],
          )),
      Container(
          height: 60,
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(review,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ReviewListScreen(profile: profile),
                  ),
                ),
                child: Container(
                child: Text('View all',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: myColors[profile.user.colorScheme],
                    )),
              )
            ],
          )),
      blockReview(profile.review[0], context),
      blockReview(profile.review[1], context)
    ]));
  }
}
