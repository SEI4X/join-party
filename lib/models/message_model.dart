import 'user_model.dart';
import 'package:flutter/material.dart';

Map<int, LinearGradient> userGradients = {
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

Map<int, Color> userShadows = {
  1: Color(0xee649bb3),
  2: Color(0xeec77e3e),
  3: Color(0xeebf4d7c),
  4: Color(0xee9a4ead),
  5: Color(0xee38a894),
};

Map<int, Color> userColors = {
  1: Color(0xff50bce2),
  2: Color(0xfff6953a),
  3: Color(0xffea4579),
  4: Color(0xffd055ef),
  5: Color(0xff00cea6),
};

class Message {
  final User sender;
  final String
      time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool isLiked;
  final bool unread;

  Message({
    this.sender,
    this.time,
    this.text,
    this.isLiked,
    this.unread,
  });
}

// YOU - current user
final User currentUser = User(
    id: 0,
    name: 'Current User',
    secondName: 'SecondName',
    imageUrl: 'assets/images/greg.jpg',
    colorScheme: 1,
    login: 'userlog',
    city: 'Moscow',
    country: 'Russia');

// USERS
final User greg = User(
    id: 1,
    name: 'Greg',
    secondName: 'Tit',
    imageUrl: 'assets/images/greg.jpg',
    colorScheme: 2,
    login: 'greggi',
    city: 'Moscow',
    country: 'Russia');
final User james = User(
    id: 2,
    name: 'James',
    secondName: 'Philips',
    imageUrl: 'assets/images/james.jpg',
    colorScheme: 3,
    login: 'jojames',
    city: 'Moscow',
    country: 'Russia');
final User john = User(
    id: 3,
    name: 'John',
    secondName: 'Hot',
    imageUrl: 'assets/images/john.jpg',
    colorScheme: 4,
    login: 'hotti',
    city: 'Moscow',
    country: 'Russia');
final User olivia = User(
    id: 4,
    name: 'Olivia',
    secondName: 'Grey',
    imageUrl: 'assets/images/olivia.jpg',
    colorScheme: 5,
    login: 'olivka',
    city: 'Moscow',
    country: 'Russia');
final User sam = User(
    id: 5,
    name: 'Sam',
    secondName: 'Jones',
    imageUrl: 'assets/images/sam.jpg',
    colorScheme: 1,
    login: 'bones',
    city: 'Moscow',
    country: 'Russia');
final User sophia = User(
    id: 6,
    name: 'Sophia',
    secondName: 'Fox',
    imageUrl: 'assets/images/sophia.jpg',
    colorScheme: 2,
    login: 'ninetailsfox',
    city: 'Moscow',
    country: 'Russia');
final User steven = User(
    id: 7,
    name: 'Steven',
    secondName: 'Tames',
    imageUrl: 'assets/images/steven.jpg',
    colorScheme: 3,
    login: 'hero228',
    city: 'Moscow',
    country: 'Russia');

// FAVORITE CONTACTS
List<User> favorites = [sam, steven, olivia, john, greg];

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: james,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: olivia,
    time: '4:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: john,
    time: '3:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sophia,
    time: '2:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: steven,
    time: '1:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sam,
    time: '12:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: greg,
    time: '11:30 AM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: james,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Just walked my doge. She was super duper cute. The best pupper!!',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '3:45 PM',
    text: 'How\'s the doggo?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '3:15 PM',
    text: 'All the food',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Nice! What kind of food did you eat?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '2:00 PM',
    text: 'I ate so much food today.',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '2:00 PM',
    text: 'I ate so much food today.',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '2:00 PM',
    text: 'I ate so much food today.',
    isLiked: false,
    unread: true,
  ),
];
