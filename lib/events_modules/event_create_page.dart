import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:join_party/models/colors.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class EventCreatePage extends StatefulWidget {
  @override
  _EventCreatePageState createState() => _EventCreatePageState();
}

class _EventCreatePageState extends State<EventCreatePage> {
  TextEditingController _controller;
  DateTime _date;
  DateTime _time;
  String dropdownValue = 'Sports';

  void initState() {
    super.initState();
    _controller = TextEditingController();
    _date = DateTime.now();
    _time = DateTime.now();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void dateChanged(DateTime date) {
    setState(() {
      _date = date;
    });
  }

  void timeChanged(DateTime time) {
    setState(() {
      _time = time;
    });
  }

  selectedItemChanged() {}

  List<String> _tags = ['Sports', 'Walk', 'Food', 'Party', 'Сulture'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffefefef),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 10,
              bottom: MediaQuery.of(context).padding.bottom + 20,
              left: 12,
              right: 12),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: <Widget>[
                      InkWell(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.only(bottom: 10),
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Close",
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                                color: Colors.blueGrey[700],
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            Navigator.pop(context);
                          });
                        },
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "New event",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            color: myColors[3],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15),
                padding: EdgeInsets.only(bottom: 5, left: 5, right: 5),
                decoration: BoxDecoration(
                  gradient: myGradients[1],
                  borderRadius: BorderRadius.circular(17),
                  boxShadow: [
                    BoxShadow(
                      color: myShadows[1],
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: TextField(
                  maxLength: 69,
                  decoration: InputDecoration(
                    hintText: "Event title",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15),
                padding: EdgeInsets.only(bottom: 5, left: 5, right: 5),
                decoration: BoxDecoration(
                  gradient: myGradients[5],
                  borderRadius: BorderRadius.circular(17),
                  boxShadow: [
                    BoxShadow(
                      color: myShadows[5],
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: TextField(
                  maxLength: 69,
                  decoration: InputDecoration(
                    hintText: "Event address",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 5, left: 5, right: 5),
                decoration: BoxDecoration(
                  gradient: myGradients[2],
                  borderRadius: BorderRadius.circular(17),
                  boxShadow: [
                    BoxShadow(
                      color: myShadows[2],
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: TextField(
                  maxLength: 200,
                  minLines: 1,
                  maxLines: 13,
                  style: TextStyle(
                    color: Color(0xffffffff),
                  ),
                  decoration: InputDecoration(
                    hintText: "Event description",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      borderRadius: BorderRadius.circular(21),
                      onTap: () {
                        DatePicker.showDatePicker(
                          context,
                          minTime: DateTime.now(),
                          maxTime: DateTime(2030, 12, 31),
                          onConfirm: (date) {
                            setState(() {
                              _date = date;
                            });
                          },
                          currentTime: DateTime.now(),
                          locale: LocaleType.en,
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 5 * 3 - 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(21),
                          gradient: myGradients[6],
                          boxShadow: [
                            BoxShadow(
                              color: myShadows[6],
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Date: ${_date.day}.${_date.month}.${_date.year}",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(21),
                      onTap: () {
                        DatePicker.showTimePicker(context,
                            showSecondsColumn: false, onConfirm: (time) {
                          setState(() {
                            _time = time;
                          });
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 5 * 2 - 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(21),
                          gradient: myGradients[6],
                          boxShadow: [
                            BoxShadow(
                              color: myShadows[6],
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Time: ${_time.hour}:${_time.minute > 9 ? _time.minute : "0${_time.minute}"}",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          height: 74,
                          width: 180,
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 5, bottom: 5),
                          decoration: BoxDecoration(
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(21),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Tag:  ",
                                style: TextStyle(fontSize: 18),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: DropdownButton<String>(
                                  value: dropdownValue,
                                  icon: Icon(EvaIcons.arrowDownOutline),
                                  iconSize: 40,
                                  style: TextStyle(
                                      color: myColors[4], fontSize: 18),
                                  underline: Container(
                                    height: 2,
                                    color: myColors[4],
                                  ),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      dropdownValue = newValue;
                                    });
                                  },
                                  items: _tags.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          )),
                    ),
                    Container(
                      height: 74,
                      width: MediaQuery.of(context).size.width - 215,
                      decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(21)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Import header image",
                          style: TextStyle(color: myColors[4], fontSize: 17),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
