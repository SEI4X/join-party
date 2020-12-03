import 'package:clip_shadow/clip_shadow.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'register_second_view.dart';
import 'package:join_party/models/colors.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          decoration: BoxDecoration(
            gradient: myGradients[6],
          ),
          child: Stack(
            children: <Widget>[
              ClipShadow(
                clipper: new UpperClipper(),
                boxShadow: [
                  BoxShadow(
                    color: myShadows[1],
                    spreadRadius: 4,
                    blurRadius: 4,
                    offset: Offset(1, 4), // changes position of shadow
                  ),
                ],
                child: Container(
                  height: MediaQuery.of(context).size.height / 3.5,
                  decoration: BoxDecoration(
                    gradient: myGradients[1],
                    boxShadow: [
                      BoxShadow(
                        color: myShadows[6],
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: ClipShadow(
                  clipper: new BottomClipper(),
                  boxShadow: [
                    BoxShadow(
                      color: myShadows[2],
                      spreadRadius: 4,
                      blurRadius: 4,
                      offset: Offset(-1, -4), // changes position of shadow
                    ),
                  ],
                  child: Container(
                    padding: EdgeInsets.only(bottom: 0),
                    height: MediaQuery.of(context).size.height / 3.5,
                    decoration: BoxDecoration(gradient: myGradients[2]),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: ClipShadow(
                  clipper: new UpperClipper2(),
                  boxShadow: [
                    BoxShadow(
                      color: myShadows[3],
                      spreadRadius: 4,
                      blurRadius: 4,
                      offset: Offset(-1, 4), // changes position of shadow
                    ),
                  ],
                  child: Container(
                    padding: EdgeInsets.only(bottom: 0),
                    height: MediaQuery.of(context).size.height / 2.5,
                    decoration: BoxDecoration(gradient: myGradients[3]),
                  ),
                ),
              ),
              Positioned(
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          EvaIcons.arrowIosBackOutline,
                          color: Colors.white,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Back",
                          style: TextStyle(
                              color: Colors.white,
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
                alignment: Alignment.center,
                child: Container(
                  child: Container(
                    alignment: Alignment.center,
                    width: 360,
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Register",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[700]),
                          ),
                          SizedBox(height: 30),
                          Container(
                            padding: EdgeInsets.only(
                              left: 10,
                              right: 20,
                              bottom: 0,
                            ),
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                  color: myShadows[6],
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(EvaIcons.personOutline),
                                SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width: 230,
                                  child: TextField(
                                    keyboardType: TextInputType.emailAddress,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Email',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 2),
                          Container(
                            padding: EdgeInsets.only(
                              left: 10,
                              right: 20,
                              bottom: 0,
                            ),
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: myShadows[6],
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(EvaIcons.lockOutline),
                                SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width: 230,
                                  child: TextField(
                                    keyboardType: TextInputType.visiblePassword,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Password',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 2),
                          Container(
                            padding: EdgeInsets.only(
                              left: 10,
                              right: 20,
                              bottom: 0,
                            ),
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: myShadows[6],
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(EvaIcons.lockOutline),
                                SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width: 230,
                                  child: TextField(
                                    keyboardType: TextInputType.visiblePassword,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Repeat password',
                                    ),
                                  ),
                                ),
                              ],
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
                              width: 300,
                              height: 50,
                              decoration: BoxDecoration(
                                gradient: myGradients[5],
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(20)),
                                boxShadow: [
                                  BoxShadow(
                                    color: myShadows[6],
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Icon(
                                EvaIcons.checkmarkOutline,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UpperClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
      size.width / 25,
      size.height,
      size.width / 15,
      size.height / 1.2,
    );
    path.quadraticBezierTo(
      size.width / 6,
      size.height / 2.5,
      size.width / 3,
      size.height / 3,
    );
    path.quadraticBezierTo(
      size.width / 2,
      size.height / 4,
      size.width / 2,
      0,
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

class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width / 20, size.height);

    path.quadraticBezierTo(
      size.width * 0.12,
      size.height * 0.85,
      size.width * 0.3,
      size.height * 0.80,
    );
    path.quadraticBezierTo(
      size.width * 0.85,
      size.height * 0.70,
      size.width * 0.92,
      size.height * 0.15,
    );
    path.quadraticBezierTo(
      size.width * 0.94,
      size.height * 0.02,
      size.width,
      0,
    );
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class UpperClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width, 0);

    path.quadraticBezierTo(
      size.width * 0.4,
      size.height * 0.3,
      size.width * 0.75,
      size.height * 0.6,
    );
    path.quadraticBezierTo(
      size.width * 0.9,
      size.height * 0.7,
      size.width * 0.9,
      size.height * 0.85,
    );
    path.quadraticBezierTo(
      size.width * 0.9,
      size.height * 0.95,
      size.width,
      size.height,
    );
    //path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
