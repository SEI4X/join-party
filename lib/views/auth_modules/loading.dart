import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:join_party/views/auth_modules/login_view.dart';
import 'package:join_party/views/main_view.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool _isLogged = false;
    _getLoginState() async {
      final storage = new FlutterSecureStorage();
      if (await storage.read(key: "isLogged") == "1") {
        _isLogged = true;
      } else {
        _isLogged = false;
      }
      print(await storage.read(key: "isLogged") + "$_isLogged");
    }

    _getLoginState();
    Future.delayed(Duration(milliseconds: 10), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => _isLogged ? MainPage() : LoginPage(),
        ),
        (Route<dynamic> route) => false,
      );
    });
    return Scaffold(
        body: Container(
      child: Center(
        child: Text(
          "Loading...",
          style: TextStyle(color: Colors.black),
        ),
      ),
      decoration: BoxDecoration(color: Colors.white),
    ));
  }
}
