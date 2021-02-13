import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:join_party/models/message_model.dart';
import 'package:join_party/models/sql/repository_users.dart';
import 'package:join_party/models/user_model.dart';
import 'package:intl/intl.dart';

class MessagesTable {
  int id;
  int receiverId;
  int senderId;
  String content;
  DateTime createDate;
  int chatId;

  MessagesTable(this.id, this.receiverId, this.senderId, this.content,
      this.createDate, this.chatId);

  factory MessagesTable.fromJson(dynamic json) {
    return MessagesTable(
        json['id'] as int,
        json['receiver_id'] as int,
        json['sender_id'] as int,
        json['content'] as String,
        DateTime.parse(json['create_date']),
        json['chat_id'] as int);
  }

  @override
  String toString() {
    return '{ ${this.id}, ${this.receiverId}, ${this.senderId}, ${this.content} , ${this.createDate}, ${this.chatId}}';
  }
}

class ChatsTable {
  int id;
  int firstUser;
  int secondUser;

  ChatsTable(this.id, this.firstUser, this.secondUser);

  factory ChatsTable.fromJson(dynamic json) {
    return ChatsTable(json['id'] as int, json['first_user'] as int,
        json['second_user'] as int);
  }

  @override
  String toString() {
    return '{ ${this.id}, ${this.firstUser}, ${this.secondUser} }';
  }
}

Future<List<MessagesTable>> getMessageTableByChatId(int chatId) async {
  Map<String, String> value = {"chat_id": chatId.toString()};
  Uri uri = Uri.parse("http://joinparty.ru/messages/chat_id");
  final url = uri.replace(queryParameters: value);
  http.Response response = await http.get(url);
  var jsonList = jsonDecode(response.body) as List;
  List<MessagesTable> messages = jsonList
      .map((messageJson) => MessagesTable.fromJson(messageJson))
      .toList();
  return messages;
}

Future<List<ChatsTable>> getChatsByUserId(int userId) async {
  Map<String, String> value = {"user_id": userId.toString()};
  Uri uri = Uri.parse("http://joinparty.ru/chats/user_id");
  final url = uri.replace(queryParameters: value);
  http.Response response = await http.get(url);
  var jsonList = jsonDecode(response.body) as List;
  List<ChatsTable> chats =
      jsonList.map((messageJson) => ChatsTable.fromJson(messageJson)).toList();
  return chats;
}

Future<ChatsTable> getChatTableByUsers(int friendId, int userId) async {
  Map<String, String> value = {
    "first_user": userId.toString(),
    "second_user": friendId.toString()
  };
  Uri uri = Uri.parse("http://joinparty.ru/chats/find");
  final url = uri.replace(queryParameters: value);
  http.Response response = await http.get(url);
  var jsonList = jsonDecode(response.body);
  ChatsTable chat = ChatsTable.fromJson(jsonList);
  return chat;
}

Future<Chat> getChatByUsers(int friendId, int userId) async {
  ChatsTable chatTable;
  await getChatTableByUsers(friendId, userId).then((value) {
    chatTable = value;
  });

  User friend;
  await getUserById(friendId).then((value) {
    friend = value;
  });

  User user;
  await getUserById(userId).then((value) {
    user = value;
  });

  return (new Chat(id: chatTable.id, user: user, sender: friend));
}

Future<List<Message>> getMessageByChatId(int chatId) async {
  List<MessagesTable> messagesTable;
  await getMessageTableByChatId(chatId).then((value) {
    messagesTable = value;
  });

  List<Message> messages = List<Message>();

  messagesTable.forEach((message) {
    messages.add(Message(
        senderId: message.senderId,
        text: message.content,
        date: message.createDate));
  });

  return messages;
}

// Future<List<Chat>> getUserChats(userId) async {
//   List<ChatsTable> chatsTable;
//   await getChatsByUserId(userId).then((value) {
//     chatsTable = value;
//   });

//   List<Chat> chats = List<Chat>();

//   for (var chat in chatsTable) {
//     List<Message> chatMessages;
//     await getMessageByChatId(chat.id).then((value) {
//       chatMessages = value;
//     });
//     User user;
//     await getUserById(
//             chat.firstUser == userId ? chat.secondUser : chat.firstUser)
//         .then((value) {
//       user = value;
//     });
//     chats.add(Chat(id: chat.id, messages: chatMessages, sender: user));
//   }
//   return chats;
// }

Future<List<Chat>> getUserChats(userId) async {
  List<ChatsTable> chatsTable;
  await getChatsByUserId(userId).then((value) {
    chatsTable = value;
  });

  List<Chat> chats = List<Chat>();

  for (var chat in chatsTable) {
    List<Message> chatMessages;
    await getMessageByChatId(chat.id).then((value) {
      chatMessages = value;
    });
    User user;
    await getUserById(
            chat.firstUser == userId ? chat.secondUser : chat.firstUser)
        .then((value) {
      user = value;
    });
    chats.add(Chat(id: chat.id, messages: chatMessages, sender: user));
  }
  return chats;
}

Future<List<Chat>> getUserChatsForStream(userId) async {
  List<Chat> chats;
  await getUserChats(userId).then((value) {
    chats = value;
  });
  return chats;
}

Future<void> postMessage(MessagesTable message) async {
  var url = 'http://joinparty.ru/messages/new_mes';
  await http.post(url, body: {
    "receiver_id": message.receiverId.toString(),
    "sender_id": message.senderId.toString(),
    "content": message.content,
    "create_date": DateFormat('yyyy-MM-dd HH:mm:ss').format(message.createDate),
    "chat_id": message.chatId.toString(),
  });
}

Future<Chat> postChat(Chat chat) async {
  var url = 'http://joinparty.ru/chats/new';

  var response = await http.put(url, body: {
    "first_user": chat.user.id.toString(),
    "second_user": chat.sender.id.toString(),
  });
  ChatsTable newChat;
  var jsonResponse = jsonDecode(response.body);
  newChat = ChatsTable.fromJson(jsonResponse);
  User sender;
  await getUserById(newChat.secondUser).then((value) {
    sender = value;
  });

  List<Message> messages;
  await getMessageByChatId(newChat.id).then((value) {
    messages = value;
  });
  return (Chat(id: newChat.id, sender: sender, messages: messages));
}
