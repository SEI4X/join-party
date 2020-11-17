import 'package:platform_maps_flutter/platform_maps_flutter.dart';
import 'user_model.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Event {
  final int id;
  final User creator;
  final String name;
  final String place;
  final String date;
  final String time;
  final List<User> members;
  final String imageUrl;
  final String description;
  final bool isActive;
  final int colorScheme;
  final LatLng position;
  final String tag;
  final int chatId;
  final bool isPrivate;

  void getEvents() async {
    var url = 'https://joinparty.ru/connect.php';
    var response = await get(url);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var itemCount = jsonResponse['totalItems'];
      print('Number of events about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  Event(
      {this.id,
      this.creator,
      this.date,
      this.time,
      this.name,
      this.place,
      this.position,
      this.members,
      this.isActive,
      this.colorScheme,
      this.imageUrl,
      this.description,
      this.chatId,
      this.isPrivate,
      this.tag});
}

// EXAMPLE CHATS ON HOME SCREEN
List<Event> events = [];
