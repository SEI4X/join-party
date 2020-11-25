import 'package:clip_shadow/clip_shadow.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:join_party/auth_modules/register_screen.dart';
import 'package:join_party/models/colors.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget _socialNetworks(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.17),
      width: 216,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Login with",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/google.png"),
                  ),
                ),
              ),
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/vk.png"),
                  ),
                ),
              ),
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/tiktok.png"),
                  ),
                ),
              ),
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/inst.png"),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

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
                  height: MediaQuery.of(context).size.height / 3,
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
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(gradient: myGradients[2]),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  child: Container(
                    alignment: Alignment.center,
                    width: 360,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Login",
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
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        enableSuggestions: false,
                                        autocorrect: false,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Email or phone',
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
                                        keyboardType:
                                            TextInputType.visiblePassword,
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
                              SizedBox(height: 40),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't have an account? ",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  GestureDetector(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => RegisterPage(),
                                      ),
                                    ),
                                    child: Text(
                                      "Register",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: myColors[3]),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              child: Icon(
                                EvaIcons.arrowForward,
                                color: Color(0xffffffff),
                              ),
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  gradient: myGradients[5],
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                      color: myShadows[6],
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: Offset(0, 1),
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: _socialNetworks(context),
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
      size.width / 15,
      size.height,
      size.width / 10,
      size.height / 1.2,
    );
    path.quadraticBezierTo(
      size.width / 6,
      size.height / 2.5,
      size.width / 2,
      size.height / 3,
    );
    path.quadraticBezierTo(
      size.width / 1.1,
      size.height / 4,
      size.width,
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
