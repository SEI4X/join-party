import 'package:join_party/models/sql/database_creator.dart';

class User {
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

  User(
      {this.id,
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
      this.about});

  User.fromJson(Map<String, dynamic> json) {
    this.id = json[DatabaseCreator.id];
    this.name = json[DatabaseCreator.firstName];
    this.secondName = json[DatabaseCreator.secondName];
    this.login = json[DatabaseCreator.login];
    this.imageUrl = json[DatabaseCreator.imageUrl];
    this.colorScheme = json[DatabaseCreator.colorScheme];
    this.country = json[DatabaseCreator.country];
    this.city = json[DatabaseCreator.city];
    this.instId = json[DatabaseCreator.inst];
    this.tikTokId = json[DatabaseCreator.tikTok];
    this.twitterId = json[DatabaseCreator.twitter];
    this.vkId = json[DatabaseCreator.vk];
    this.about = json[DatabaseCreator.about];
  }

  @override
  String toString() {
    return '{ ${this.id}, ${this.name}, ${this.secondName}, ${this.imageUrl} , ${this.colorScheme}, ${this.login}, ${this.country}, ${this.city}, ${this.instId}, ${this.tikTokId} , ${this.twitterId}, ${this.vkId}, ${this.about} }';
  }
}
