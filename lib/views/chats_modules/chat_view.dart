import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:join_party/models/colors.dart';
import 'package:join_party/models/sql/repository_messages.dart';
import '../../models/message_model.dart';
import '../../models/user_model.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  final Chat chat;

  ChatScreen({this.chat});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController messageTextController = TextEditingController();

  final StreamController _messageController = StreamController();
  Stream get messageController => _messageController.stream;

  Stream<List<Message>> get messageListView async* {
    yield await getMessageByChatId(widget.chat.id);
  }

  sendMessage() {
    if (messageTextController.text.isNotEmpty) {
      MessagesTable message = MessagesTable(
          1,
          widget.chat.sender.id,
          currentUser.id,
          messageTextController.text,
          DateTime.now(),
          widget.chat.id);
      messageTextController.text = "";
      postMessage(message);
    }
  }

  _buildMessage(Message message, bool isMe) {
    final Container msg = Container(
      margin: isMe
          ? EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 80.0,
            )
          : EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              right: 80.0,
            ),
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        color: isMe ? Color(0xFFAFEEEE) : Color(0xFFFFEFEE),
        borderRadius: isMe
            ? BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              )
            : BorderRadius.only(
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            DateFormat.jm().format(message.date),
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            message.text,
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
    return msg;
  }

  _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              controller: messageTextController,
              onChanged: (value) {},
              decoration: InputDecoration.collapsed(
                hintText: 'Send a message...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25.0,
            color: myColors[widget.chat.sender.colorScheme],
            onPressed: sendMessage(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColors[widget.chat.sender.colorScheme],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          widget.chat.sender.name,
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  child: StreamBuilder(
                      stream: messageListView,
                      builder: (context, snapshot) {
                        return ListView.builder(
                            padding: EdgeInsets.only(top: 15.0),
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              final Message message = snapshot.data[index];
                              final bool isMe =
                                  message.senderId != widget.chat.sender.id;
                              return _buildMessage(message, isMe);
                            });
                      }),
                ),
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }
}
