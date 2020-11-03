import 'package:flutter/material.dart';
import 'package:platform_maps_flutter/platform_maps_flutter.dart';

import 'user_model.dart';

Map<int, LinearGradient> eventGradient = {
  1: LinearGradient(
    colors: [Color(0xcc83e2f7), Color(0xcc50bce2)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  2: LinearGradient(
    colors: [Color(0xeeffac5e), Color(0xeef6953a)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  3: LinearGradient(
    colors: [Color(0xeeff88bd), Color(0xeeea4579)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  4: LinearGradient(
    colors: [Color(0xeee795fa), Color(0xeed055ef)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  5: LinearGradient(
    colors: [Color(0xee5af0c9), Color(0xee00cea6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
};

Map<int, Color> eventShadows = {
  1: Color(0xee649bb3),
  2: Color(0xeec77e3e),
  3: Color(0xeebf4d7c),
  4: Color(0xee9a4ead),
  5: Color(0xee38a894),
};

Map<int, Color> eventColors = {
  1: Color(0xff50bce2),
  2: Color(0xfff6953a),
  3: Color(0xffea4579),
  4: Color(0xffd055ef),
  5: Color(0xff00cea6),
};

class Event {
  final User sender;
  final String date;
  final String time;
  final String name;
  final String place;
  final LatLng position;
  final int membersCount;
  final List<User> members;
  final bool isActive;
  final int colorScheme;
  final String imageUrl;
  final String description;
  final bool hasImage;
  // final GroupMessage chat;

  Event({
    this.sender,
    this.date,
    this.time,
    this.name,
    this.place,
    this.position,
    this.membersCount,
    this.members,
    this.isActive,
    this.colorScheme,
    this.imageUrl,
    this.description,
    this.hasImage,
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
List<Event> events = [
  Event(
    sender: james,
    date: '22.12.2020',
    time: '18:30',
    name: 'Открытие нового бара в центре москвы!',
    place: 'Москва, Китай-Город',
    position: LatLng(55.753858, 37.620666),
    membersCount: 56,
    members: [james, steven, sophia],
    isActive: true,
    colorScheme: 1,
    imageUrl: "assets/images/bars.jpg",
    description:
        "Мы приглашаем всех желающих придти на открытие нового бара в центре москвы. Вас ждут конкурсы, бесплатная выпивка и многое другое! Не пропусти=)",
    hasImage: true,
  ),
  Event(
    sender: olivia,
    date: '01.12.2020',
    time: '22:45',
    name: 'Ночь в третьяковской галлереи',
    place: 'Москва',
    position: LatLng(55.746735, 37.593325),
    membersCount: 28,
    members: [james, steven, sophia],
    isActive: true,
    imageUrl: "assets/images/hallery.jpg",
    colorScheme: 3,
    hasImage: true,
  ),
  Event(
    sender: sophia,
    date: '14.12.2020',
    time: '20:30',
    name: "Живая музыка в баре \"Биродром\"",
    place: 'Москва, Полярная улица',
    position: LatLng(55.870701, 37.640031),
    membersCount: 321,
    members: [james, steven, sophia],
    isActive: true,
    colorScheme: 2,
    hasImage: false,
  ),
  Event(
    sender: greg,
    date: '18.11.2020',
    time: '10:00',
    name: 'День открытых дверей в МГТУ им. Н.Э.Баумана',
    place: 'Москва, Басманный проезд',
    position: LatLng(55.766038, 37.684488),
    membersCount: 3,
    imageUrl: "assets/images/mstu.jpg",
    members: [james, steven, sophia],
    isActive: true,
    colorScheme: 5,
    hasImage: true,
  ),
  Event(
    sender: sam,
    date: '05.11.2020',
    time: '14:00',
    name: 'Покатушки на велосипедах',
    place: 'Москва, Измайловский лес',
    position: LatLng(55.784402, 37.759024),
    membersCount: 5829,
    members: [james, steven, sophia],
    isActive: true,
    colorScheme: 4,
    hasImage: false,
  ),
  Event(
    sender: steven,
    date: '9.11.2020',
    time: '18:00',
    name: 'Прогулка по ВДНХ',
    place: 'Москва, ВДНХ',
    position: LatLng(55.830338, 37.631082),
    membersCount: 56,
    members: [james, steven, sophia],
    isActive: true,
    colorScheme: 2,
    hasImage: false,
  ),
];
