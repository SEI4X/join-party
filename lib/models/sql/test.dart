import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  var url = 'http://joinparty.ru/users/about/' + 1.toString();
  await http.post(url, body: {
    "first_name": "Tamerlan",
    "second_name": "Saparbi",
    "country": "Russia",
    "city": "Moscow",
    "about": "BMSTU Student",
  });
}
