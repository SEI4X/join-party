import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'package:join_party/models/colors.dart';
import 'package:join_party/models/user_model.dart';
import 'package:join_party/views/auth_modules/register_second_view.dart';

class NewReview extends StatefulWidget {
  final User sender;
  final User recipient;
  NewReview({this.sender, this.recipient});

  @override
  _NewReviewState createState() => _NewReviewState();
}

class _NewReviewState extends State<NewReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: <Widget>[
            Positioned(
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        EvaIcons.arrowIosBackOutline,
                        color: Colors.black87,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Back",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
              left: 20,
              top: MediaQuery.of(context).padding.top + 10,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top + 10),
                    child: Text(
                      "Review for ${widget.recipient.name}",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[700]),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    padding: EdgeInsets.only(
                      left: 10,
                      right: 20,
                      bottom: 0,
                    ),
                    width: 350,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: myShadows[6],
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: SizedBox(
                      width: 270,
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 7,
                        enableSuggestions: false,
                        autocorrect: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Review",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 2),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => RegisterEndPage(),
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 20,
                        bottom: 0,
                      ),
                      width: 350,
                      height: 50,
                      decoration: BoxDecoration(
                        gradient: myGradients[5],
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(20)),
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
                          "Send",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
