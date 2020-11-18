import 'package:join_party/models/events_model.dart';
import 'package:join_party/models/user_model.dart';

Profile profile = Profile(
  user: user,
  about: "Hello World",
);

class Review {
  final int id;
  final int userId;
  final User sender;
  final String date;
  final String text;

  Review({this.id, this.userId, this.sender, this.date, this.text});
}

class Awards {
  final int id;
  final String name;
  final String about;
  final String imageUrl;

  Awards({this.id, this.name, this.about, this.imageUrl});
}

class Profile {
  final User user;
  final String about;
  List<Event> events = new List<Event>();
  List<Awards> awards = new List<Awards>();
  List<User> friends = new List<User>();
  List<Review> review = new List<Review>();

  Profile(
      {this.user,
      this.about,
      this.events,
      this.awards,
      this.friends,
      this.review});
}
