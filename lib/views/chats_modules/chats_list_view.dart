import 'package:flutter/material.dart';
import 'package:join_party/models/colors.dart';
import '../../models/message_model.dart';
import 'chat_view.dart';

class ChatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50),
      decoration: BoxDecoration(gradient: myGradients[6]),
      child: ClipRRect(
        child: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (BuildContext context, int index) {
            final Message chat = chats[index];
            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatScreen(
                    user: chat.sender,
                  ),
                ),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 7.0, horizontal: 10),
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  boxShadow: [
                    BoxShadow(
                      color: myShadows[6],
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 76,
                              height: 76,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(38)),
                                color: Color(0xffffffff),
                              ),
                            ),
                            CircleAvatar(
                              radius: 35.0,
                              backgroundImage: AssetImage(chat.sender.imageUrl),
                            )
                          ],
                        ),
                        SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              chat.sender.name,
                              style: TextStyle(
                                color: myColors[chat.sender.colorScheme],
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: Text(
                                chat.text,
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          chat.time,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        chat.unread
                            ? Container(
                                width: 40.0,
                                height: 20.0,
                                decoration: BoxDecoration(
                                  color: myColors[chat.sender.colorScheme],
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'NEW',
                                  style: TextStyle(
                                    color: Color(0xffffffff),
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            : Text(''),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
