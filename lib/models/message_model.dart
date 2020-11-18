import 'events_model.dart';
import 'user_model.dart';

List<Message> messages = [Message(sender: user)];
List<Chat> chats = [Chat(sender: user, messages: messages)];

class Chat {
  final User sender;
  List<Message> messages = new List<Message>();

  Chat({this.sender, this.messages});
}

class Message {
  final User sender;
  final String time;
  final String date;
  final String text;
  final bool unread;

  Message({
    this.sender,
    this.time,
    this.date,
    this.text,
    this.unread,
  });
}

class EventChat {
  final Event event;
  List<Message> messages = new List<Message>();

  EventChat({this.event, this.messages});
}
