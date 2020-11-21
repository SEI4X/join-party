import 'package:platform_maps_flutter/platform_maps_flutter.dart';
import 'user_model.dart';
import 'package:http/http.dart';
import 'dart:convert' show utf8;

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

  void postEvents() async {
    final response =
        await post("https://joinparty.ru/apis/post_events.php", body: {
      "creator_id": creator.id.toString(),
      "event_name": utf8.encode(name),
      "place": utf8.encode(place),
      "event_datetime":
          utf8.encode("$date $time"), // Format: 2020-11-17 13:40:13
      "image_url": utf8.encode(imageUrl),
      "event_description": utf8.encode(description),
      "color_scheme": utf8.encode(colorScheme.toString()),
      "lang": utf8.encode(position.longitude.toString()),
      "lat": utf8.encode(position.latitude.toString()),
      "tag": utf8.encode(tag),
      "is_active": isActive ? 1.toString() : 0.toString(),
      "is_private": isPrivate ? 1.toString() : 0.toString(),
    });
  }

  void getEvent() async {}
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
    creator: james,
    date: '22.12.2020',
    time: '18:30',
    name: 'Открытие нового бара в центре москвы!',
    place: 'Москва, Китай-Город',
    position: LatLng(55.753858, 37.620666),
    members: [james, steven, sophia],
    isActive: true,
    colorScheme: 1,
    imageUrl: "assets/images/bars.jpg",
    description:
        "Мы приглашаем всех желающих придти на открытие нового бара в центре москвы. Вас ждут конкурсы, бесплатная выпивка и многое другое! Не пропусти=)",
  ),
  Event(
    creator: olivia,
    date: '01.12.2020',
    time: '22:45',
    name: 'Ночь в третьяковской галлереи',
    place: 'Москва',
    position: LatLng(55.746735, 37.593325),
    members: [james, steven, sophia],
    isActive: true,
    imageUrl: "assets/images/hallery.jpg",
    colorScheme: 3,
  ),
  Event(
    creator: sophia,
    date: '14.12.2020',
    time: '20:30',
    name: "Живая музыка в баре \"Биродром\"",
    place: 'Москва, Полярная улица',
    position: LatLng(55.870701, 37.640031),
    members: [james, steven, sophia],
    imageUrl: "assets/images/hallery.jpg",
    isActive: true,
    colorScheme: 2,
  ),
  Event(
    creator: greg,
    date: '18.11.2020',
    time: '10:00',
    name: 'День открытых дверей в МГТУ им. Н.Э.Баумана',
    place: 'Москва, Басманный проезд',
    position: LatLng(55.766038, 37.684488),
    imageUrl: "assets/images/mstu.jpg",
    members: [james, steven, sophia],
    isActive: true,
    colorScheme: 5,
  ),
  Event(
    creator: sam,
    date: '05.11.2020',
    time: '14:00',
    name: 'Покатушки на велосипедах',
    place: 'Москва, Измайловский лес',
    position: LatLng(55.784402, 37.759024),
    members: [james, steven, sophia],
    isActive: true,
    colorScheme: 4,
  ),
  Event(
    creator: steven,
    date: '9.11.2020',
    time: '18:00',
    name: 'Прогулка по ВДНХ',
    place: 'Москва, ВДНХ',
    position: LatLng(55.830338, 37.631082),
    members: [james, steven, sophia],
    isActive: true,
    colorScheme: 2,
  ),
];

// EXAMPLE CHATS ON HOME SCREEN
