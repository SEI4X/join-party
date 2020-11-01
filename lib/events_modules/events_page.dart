import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import '../models/events_model.dart';
import 'event_screen.dart';

class EventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50),
      decoration: BoxDecoration(color: Colors.white),
      child: ClipRRect(
        child: ListView.builder(
          itemCount: events.length,
          itemBuilder: (BuildContext context, int index) {
            final Events event = events[index];
            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => EventScreen(
                    event: event,
                  ),
                ),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 7.0, horizontal: 10),
                padding: EdgeInsets.only(
                    left: 10.0, top: 10.0, bottom: 10, right: 10),
                decoration: BoxDecoration(
                  gradient: eventGradient[event.colorScheme],
                  boxShadow: [
                    BoxShadow(
                      color: eventShadows[event.colorScheme],
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Stack(
                  children: [
                    Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 64,
                                  height: 64,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(38)),
                                    color: Color(0xffffffff),
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage:
                                      AssetImage(event.sender.imageUrl),
                                )
                              ],
                            ),
                            SizedBox(height: 6.0),
                            Column(
                              children: [
                                Text(
                                  event.membersCount.toString(),
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Members",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          height: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            verticalDirection: VerticalDirection.down,
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Text(
                                  event.name,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  softWrap: false,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 6.0),
                              Text(
                                event.sender.name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(height: 6.0),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      EvaIcons.pin,
                                      size: 15,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      " ${event.place}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              //SizedBox(height: 40.0),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      right: 10,
                      bottom: 0,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              event.time,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              event.date,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          )
                        ],
                      ),
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
