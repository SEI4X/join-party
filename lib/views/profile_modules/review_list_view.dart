import 'dart:ui';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:join_party/models/colors.dart';
import 'package:join_party/models/profile_model.dart';

class ReviewListScreen extends StatefulWidget {
  final Profile profile;

  ReviewListScreen({this.profile});

  @override
  _ReviewListScreen createState() => _ReviewListScreen();
}

class _ReviewListScreen extends State<ReviewListScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: myColors[widget.profile.user.colorScheme],
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.transparent,
          title: Center(
            child: Text(
              "All Reviews",
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
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
                    itemCount: widget.profile.review.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Review review = widget.profile.review[index];
                      return blockReview(review, context);
                    }))));
  }
}
