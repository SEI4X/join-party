import 'package:join_party/models/user_model.dart';
import 'package:join_party/models/message_model.dart';

class Review {
  final User user;
  final String date;
  final String text;

  Review({this.user, this.date, this.text});
}

// First review
final Review firstReview =
    Review(user: greg, date: "2 Apr 2020", text: "Good man");

//Second review
final Review secondReview =
    Review(user: john, date: "2 Apr 2020", text: "Where my money, man?");

class Profile {
  final User user;
  final String about;
  final int events;
  final int awards;
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

final Profile profile = Profile(
    user: james,
    about: "My life, my rules.",
    events: 16,
    awards: 9,
    friends: [sophia, john, olivia],
    review: [firstReview, secondReview]);
