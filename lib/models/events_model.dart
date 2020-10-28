import 'package:platform_maps_flutter/platform_maps_flutter.dart';

import 'user_model.dart';

class Events {
  final User sender;
  final String date;
  final String time;
  final String name;
  final String place;
  final LatLng position;
  final int membersCount;
  final List<User> members;
  final bool isActive;
  // final GroupMessage chat;

  Events({
    this.sender,
    this.date,
    this.time,
    this.name,
    this.place,
    this.position,
    this.membersCount,
    this.members,
    this.isActive,
  });
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
List<Events> events = [
  Events(
    sender: james,
    date: '22.12.2020',
    time: '18:30',
    name: 'Открытая зимняя выставка',
    place: 'Москва, Китай-Город',
    position: LatLng(12, 13),
    membersCount: 56,
    members: [james, steven, sophia],
    isActive: true,
  ),
  Events(
    sender: olivia,
    date: '22.12.2020',
    time: '18:30',
    name: 'Открытая зимняя выставка',
    place: 'Москва, Китай-Город',
    position: LatLng(12, 13),
    membersCount: 28,
    members: [james, steven, sophia],
    isActive: true,
  ),
  Events(
    sender: sophia,
    date: '22.12.2020',
    time: '18:30',
    name: 'Открытая зимняя выставка',
    place: 'Москва, Китай-Город',
    position: LatLng(12, 13),
    membersCount: 321,
    members: [james, steven, sophia],
    isActive: true,
  ),
  Events(
    sender: greg,
    date: '22.12.2020',
    time: '18:30',
    name: 'Открытая зимняя выставка',
    place: 'Москва, Китай-Город',
    position: LatLng(12, 13),
    membersCount: 3,
    members: [james, steven, sophia],
    isActive: true,
  ),
  Events(
    sender: sam,
    date: '22.12.2020',
    time: '18:30',
    name: 'Открытая зимняя выставка',
    place: 'Москва, Китай-Город',
    position: LatLng(12, 13),
    membersCount: 5829,
    members: [james, steven, sophia],
    isActive: true,
  ),
  Events(
    sender: steven,
    date: '22.12.2020',
    time: '18:30',
    name: 'Открытая зимняя выставка',
    place: 'Москва, Китай-Город',
    position: LatLng(12, 13),
    membersCount: 56,
    members: [james, steven, sophia],
    isActive: true,
  ),
];
