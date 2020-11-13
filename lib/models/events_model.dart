import 'package:platform_maps_flutter/platform_maps_flutter.dart';

import 'user_model.dart';

class Event {
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

  Event(
      {this.creator,
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

// YOU - current user
final User currentUser = User(
  id: 0,
  name: 'Current User',
  imageUrl: 'assets/images/greg.jpg',
);

// USERS
final User greg = User(
  id: 1,
  name: 'Greg',
  imageUrl: 'assets/images/greg.jpg',
);
final User james = User(
  id: 2,
  name: 'James',
  imageUrl: 'assets/images/james.jpg',
);
final User john = User(
  id: 3,
  name: 'John',
  imageUrl: 'assets/images/john.jpg',
);
final User olivia = User(
  id: 4,
  name: 'Olivia',
  imageUrl: 'assets/images/olivia.jpg',
);
final User sam = User(
  id: 5,
  name: 'Sam',
  imageUrl: 'assets/images/sam.jpg',
);
final User sophia = User(
  id: 6,
  name: 'Sophia',
  imageUrl: 'assets/images/sophia.jpg',
);
final User steven = User(
  id: 7,
  name: 'Steven',
  imageUrl: 'assets/images/steven.jpg',
);

// FAVORITE CONTACTS
List<User> favorites = [sam, steven, olivia, john, greg];

// EXAMPLE CHATS ON HOME SCREEN
List<Event> events = [];
