import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:join_party/models/events_model.dart';
import 'package:join_party/models/sql/repository_awards.dart';
import 'package:join_party/models/sql/repository_friends.dart';
import 'package:join_party/models/sql/repository_reviews.dart';
import 'package:join_party/models/user_model.dart';

import '../profile_model.dart';

class UsersTable {
  int id;
  String name;
  String secondName;
  String imageUrl;
  int colorScheme;
  String login;
  String country;
  String city;
  String tikTokId;
  String vkId;
  String instId;
  String twitterId;
  String about;

  UsersTable(
      this.id,
      this.name,
      this.secondName,
      this.imageUrl,
      this.colorScheme,
      this.login,
      this.country,
      this.city,
      this.instId,
      this.tikTokId,
      this.twitterId,
      this.vkId,
      this.about);

  factory UsersTable.fromJson(dynamic json) {
    return UsersTable(
        json['id'] as int,
        json['name'] as String,
        json['secondName'] as String,
        json['imageUrl'] as String,
        json['colorScheme'] as int,
        json['login'] as String,
        json['country'] as String,
        json['city'] as String,
        json['instId'] as String,
        json['tikTokId'] as String,
        json['twitterId'] as String,
        json['vkId'] as String,
        json['about'] as String);
  }

  @override
  String toString() {
    return '{ ${this.id}, ${this.name}, ${this.secondName}, ${this.imageUrl} , ${this.colorScheme}, ${this.login}, ${this.country}, ${this.city}, ${this.instId}, ${this.tikTokId} , ${this.twitterId}, ${this.vkId}, ${this.about} }';
  }
}

Future<User> getUserById(int userId) async {
  Map<String, String> value = {"id": userId.toString()};
  Uri uri = Uri.parse("http://joinparty.ru/users/id");
  final url = uri.replace(queryParameters: value);
  http.Response response = await http.get(url);
  var jsonResponse = jsonDecode(response.body);
  return User(
      id: jsonResponse["id"],
      name: jsonResponse["first_name"],
      secondName: jsonResponse["second_name"],
      imageUrl: jsonResponse["image_url"],
      colorScheme: jsonResponse["color_scheme"],
      country: jsonResponse["country"],
      city: jsonResponse["city"],
      instId: jsonResponse["instagram"],
      vkId: jsonResponse["vk"],
      tikTokId: jsonResponse["tiktok"],
      twitterId: jsonResponse["image_url"],
      about: jsonResponse["about"]);
}

Future<void> postUserInfo(UsersTable user) async {
  var url = 'http://joinparty.ru/users/about/' + user.id.toString();
  await http.post(url, body: {
    "first_name": user.name,
    "second_name": user.secondName,
    "country": user.country,
    "city": user.city,
    "about": user.about,
  });
}

Future<Profile> getProfileForStream(int userId) async {
  User user;
  await getUserById(userId).then((value) {
    user = value;
  });

  List<User> friends;
  await getFriendsByUserId(userId).then((value) {
    friends = value;
  });

  List<Review> reviews;
  await getReviewsByUserId(userId).then((value) {
    reviews = value;
  });

  List<Award> awards;
  await getAwardsByUserId(userId).then((value) {
    awards = value;
  });

  return Profile(
      user: user,
      friends: friends,
      review: reviews,
      awards: awards,
      events: events);
}
