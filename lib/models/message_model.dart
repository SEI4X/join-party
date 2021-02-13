import 'user_model.dart';

class Chat {
  int id;
  User user;
  User sender;
  List<Message> messages = List<Message>();

  Chat({this.sender, this.messages, this.user, this.id});

  @override
  String toString() {
    return '{ ${this.id}, ${this.sender}, ${this.messages} }';
  }
}

class Message {
  final int senderId;
  final String text;
  final DateTime date;

  Message({this.senderId, this.text, this.date});

  @override
  String toString() {
    return '{ ${this.senderId}, ${this.text}, ${this.date} }';
  }
}

// YOU - current user
final User currentUser = User(
    id: 1,
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
    colorScheme: 1,
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
