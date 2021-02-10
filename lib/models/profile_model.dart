import 'package:join_party/models/events_model.dart';
import 'package:join_party/models/user_model.dart';

class Review {
  final User user;
  final String date;
  final String text;

  Review({this.user, this.date, this.text});
}

class Award {
  final String awardName;
  final String about;
  final String imageUrl;

  Award({this.awardName, this.about, this.imageUrl});
}

// First review
final Review firstReview =
    Review(user: greg, date: "2 Apr 2020", text: "Good man");

//Second review
final Review secondReview =
    Review(user: john, date: "2 Apr 2020", text: "Where my money, man?");

class Profile {
  final User user;
  List<Event> events = new List<Event>();
  List<Award> awards = new List<Award>();
  List<User> friends = new List<User>();
  List<Review> review = new List<Review>();

  Profile({this.user, this.events, this.awards, this.friends, this.review});
}

final Profile profile = Profile(
    user: james,
    friends: [sophia, john, olivia],
    review: [firstReview, secondReview]);
