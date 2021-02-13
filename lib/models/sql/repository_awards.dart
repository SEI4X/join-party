import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:join_party/models/profile_model.dart';

class AwardsTable {
  int id;
  String awardName;
  String about;
  String imageUrl;

  AwardsTable(
    this.id,
    this.awardName,
    this.about,
    this.imageUrl,
  );

  factory AwardsTable.fromJson(dynamic json) {
    return AwardsTable(json['id'] as int, json['award_name'] as String,
        json['about'] as String, json['image_url'] as String);
  }

  @override
  String toString() {
    return '{ ${this.id}, ${this.awardName}, ${this.about}, ${this.imageUrl} }';
  }
}

Future<AwardsTable> getAwardById(int id) async {
  Map<String, String> value = {"id": id.toString()};
  Uri uri = Uri.parse("http://joinparty.ru/awards/id");
  final url = uri.replace(queryParameters: value);
  http.Response response = await http.get(url);
  var json = jsonDecode(response.body);
  return AwardsTable.fromJson(json);
}

class AwardsWinnersTable {
  int id;
  int winnerId;
  int awardId;

  AwardsWinnersTable(
    this.id,
    this.winnerId,
    this.awardId,
  );

  factory AwardsWinnersTable.fromJson(dynamic json) {
    return AwardsWinnersTable(
        json['id'] as int, json['winner_id'] as int, json['award_id'] as int);
  }

  @override
  String toString() {
    return '{ ${this.id}, ${this.winnerId}, ${this.awardId} }';
  }
}

Future<List<AwardsWinnersTable>> getAwardsByWinnerId(int winnerId) async {
  Map<String, String> value = {"winner_id": winnerId.toString()};
  Uri uri = Uri.parse("http://joinparty.ru/awards_winners/winner_id");
  final url = uri.replace(queryParameters: value);
  http.Response response = await http.get(url);
  var jsonList = jsonDecode(response.body) as List;
  List<AwardsWinnersTable> awards = jsonList
      .map((awardsJson) => AwardsWinnersTable.fromJson(awardsJson))
      .toList();
  return awards;
}

Future<List<Award>> getAwardsByUserId(int userId) async {
  List<AwardsWinnersTable> awardsTable;
  await getAwardsByWinnerId(userId).then((value) {
    awardsTable = value;
  });
  List<Award> awards = List<Award>();
  for (var awardTable in awardsTable) {
    AwardsTable award;
    await getAwardById(awardTable.awardId).then((value) {
      award = value;
    });
    awards.add(Award(
        about: award.about,
        awardName: award.awardName,
        imageUrl: award.imageUrl));
  }
  return awards;
}
