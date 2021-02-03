import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:join_party/models/colors.dart';
import 'package:join_party/models/sql/repository_service.dart';
import 'package:join_party/models/user_model.dart';
import 'package:join_party/views/auth_modules/login_view.dart';
import 'package:join_party/views/auth_modules/register_second_view.dart';

class SettingsView extends StatefulWidget {
  final User profile;
  SettingsView({this.profile});

  @override
  _SettingsView createState() => _SettingsView();
}

class _SettingsView extends State<SettingsView> {
  _setLoginState() async {
    final storage = new FlutterSecureStorage();
    await storage.write(key: "isLogged", value: "0");
  }

  void logOut() {
    RepositoryServiceProfile.deleteProfile();
    _setLoginState();
    setState(() {});
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => LoginPage(),
      ),
      (Route<dynamic> route) => false,
    );
  }

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
                      "Settings",
                      style: TextStyle(
                          fontSize: 20,
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
                    height: 50,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(EvaIcons.personOutline),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 250,
                          child: TextField(
                            keyboardType: TextInputType.name,
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "${widget.profile.name}",
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
                    width: 350,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(EvaIcons.lockOutline),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 250,
                          child: TextField(
                            keyboardType: TextInputType.name,
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "${widget.profile.secondName}",
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
                    width: 350,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(EvaIcons.lockOutline),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 250,
                          child: TextField(
                            keyboardType: TextInputType.streetAddress,
                            enableSuggestions: false,
                            autocorrect: false,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "${widget.profile.country}",
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
                    width: 350,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(EvaIcons.lockOutline),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 250,
                          child: TextField(
                            keyboardType: TextInputType.streetAddress,
                            enableSuggestions: false,
                            autocorrect: false,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "${widget.profile.city}",
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
                    width: 350,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(EvaIcons.lockOutline),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 250,
                          child: TextField(
                            keyboardType: TextInputType.multiline,
                            minLines: 1,
                            maxLines: 4,
                            enableSuggestions: false,
                            autocorrect: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "${widget.profile.about}",
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
                          "Save",
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
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () => logOut(),
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).padding.bottom + 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "LogOut",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
