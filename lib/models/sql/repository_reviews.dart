import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:join_party/models/profile_model.dart';
import 'package:join_party/models/user_model.dart';
import 'package:join_party/models/sql/repository_users.dart';
import 'package:intl/intl.dart';

class ReviewsTable {
  int id;
  int userId;
  int senderId;
  DateTime createDate;
  String reviewText;

  ReviewsTable(
      this.id, this.userId, this.senderId, this.createDate, this.reviewText);

  factory ReviewsTable.fromJson(dynamic json) {
    return ReviewsTable(
        json['id'] as int,
        json['user_id'] as int,
        json['sender_id'] as int,
        DateTime.parse(json['create_date']),
        json['review_text'] as String);
  }

  @override
  String toString() {
    return '{ ${this.id}, ${this.userId}, ${this.senderId}, ${this.createDate}, ${this.reviewText} }';
  }
}

Future<List<ReviewsTable>> getReviewsTableByUserId(int userId) async {
  Map<String, String> value = {"user_id": userId.toString()};
  Uri uri = Uri.parse("http://joinparty.ru/reviews/user_id");
  final url = uri.replace(queryParameters: value);
  http.Response response = await http.get(url);
  var jsonList = jsonDecode(response.body) as List;
  List<ReviewsTable> reviews = jsonList
      .map((reviewsJson) => ReviewsTable.fromJson(reviewsJson))
      .toList();
  return reviews;
}

Future<List<Review>> getReviewsByUserId(int userId) async {
  List<ReviewsTable> reviewsTable;
  await getReviewsTableByUserId(userId).then((value) {
    reviewsTable = value;
  });
  List<Review> reviews = List<Review>();
  for (var review in reviewsTable) {
    User user;
    await getUserById(review.senderId).then((value) {
      user = value;
    });
    reviews.add(Review(
        user: user,
        date: DateFormat('dd MMM yyyy').format(review.createDate),
        text: review.reviewText));
  }
  return reviews;
}

Future<void> postReview(ReviewsTable review) async {
  var url = 'http://joinparty.ru/reviews/new';
  await http.post(url, body: {
    "user_id": review.userId.toString(),
    "sender_id": review.senderId.toString(),
    "create_date": DateFormat('yyyy-MM-dd').format(review.createDate),
    "review_text": review.reviewText.toString(),
  });
}
