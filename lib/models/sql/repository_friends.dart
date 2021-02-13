import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:join_party/models/user_model.dart';
import 'package:join_party/models/sql/repository_users.dart';

class FriendsTable {
  int id;
  int friendOne;
  int friendTwo;
  int status;

  FriendsTable(
    this.id,
    this.friendOne,
    this.friendTwo,
    this.status,
  );

  factory FriendsTable.fromJson(dynamic json) {
    return FriendsTable(json['id'] as int, json['friend_one'] as int,
        json['friend_two'] as int, json['status'] as int);
  }

  @override
  String toString() {
    return '{ ${this.id}, ${this.friendOne}, ${this.friendTwo}, ${this.status} }';
  }
}

Future<List<FriendsTable>> getFriendsIdByUserId(int userId) async {
  Map<String, String> value = {"user_id": userId.toString()};
  Uri uri = Uri.parse("http://joinparty.ru/friends/user_id");
  final url = uri.replace(queryParameters: value);
  http.Response response = await http.get(url);
  var jsonList = jsonDecode(response.body) as List;
  List<FriendsTable> friends = jsonList
      .map((messageJson) => FriendsTable.fromJson(messageJson))
      .toList();
  return friends;
}

Future<List<User>> getFriendsByUserId(int userId) async {
  List<FriendsTable> friendsTable;
  await getFriendsIdByUserId(userId).then((value) {
    friendsTable = value;
  });
  List<User> friends = List<User>();
  for (var friend in friendsTable) {
    User user;
    await getUserById(
            friend.friendOne == userId ? friend.friendTwo : friend.friendTwo)
        .then((value) {
      user = value;
    });
    friends.add(user);
  }
  return friends;
}
