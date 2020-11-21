import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:join_party/models/colors.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:join_party/models/events_model.dart';
import 'package:join_party/models/profile_model.dart';
import 'package:platform_maps_flutter/platform_maps_flutter.dart';

class EventCreatePage extends StatefulWidget {
  @override
  _EventCreatePageState createState() => _EventCreatePageState();
}

class _EventCreatePageState extends State<EventCreatePage> {
  TextEditingController _controller;
  DateTime _date;
  DateTime _time;
  String dropdownValue = 'Sports';
  final eventNameController = TextEditingController();
  final eventAdressController = TextEditingController();
  final eventDescriptionController = TextEditingController();

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

  checkData() {
    String cont = "";
    int _timeCount = _time.minute + _time.hour * 60 + _date.day * 24 * 60;
    if (eventNameController.text.length < 6) {
      cont = "Title";
    }
    if (eventAdressController.text.length < 6) {
      cont = "Addres";
    }
    if (eventDescriptionController.text.length < 6) {
      cont = "Description";
    }
    if (_timeCount <
        (DateTime.now().minute +
            DateTime.now().hour * 60 +
            DateTime.now().day * 24 * 60)) {
      cont = "Date";
    }
    if (cont == "") {
      setData();
      Navigator.pop(context);
    } else {
      _showAlert(context, cont);
    }
  }

  void _showAlert(BuildContext context, String text) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        title: Text("Oops..."),
        content: Text("$text is incorrect. Please, enter correct values."),
        actions: [
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  setData() async {
    Event event = Event(
        name: eventNameController.text,
        place: eventAdressController.text,
        description: eventDescriptionController.text,
        date: "${_date.year}-${_date.month}-${_date.day}",
        time: "${_time.hour}:${_time.minute}:00",
        tag: "",
        imageUrl: "-1",
        creator: profile.user,
        colorScheme: profile.user.colorScheme,
        position: LatLng(113, 324),
        isActive: true,
        isPrivate: false);
    event.postEvents();
  }

  selectedItemChanged() {}

  List<String> _tags = ['Sports', 'Walk', 'Food', 'Party', 'Сulture'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: myGradients[6]),
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
                            height: 40,
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
                                  color: myColors[3],
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
                          child: Container(
                            padding: EdgeInsets.only(top: 8),
                            height: 40,
                            child: Text(
                              "New event",
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[800],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Save",
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w500,
                                    color: myColors[1],
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                checkData();
                              });
                            },
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
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(17),
                    boxShadow: [
                      BoxShadow(
                        color: myShadows[6],
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: TextField(
                    style: TextStyle(color: myColors[1]),
                    controller: eventNameController,
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
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(17),
                    boxShadow: [
                      BoxShadow(
                        color: myShadows[6],
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: TextField(
                    style: TextStyle(color: myColors[2]),
                    controller: eventAdressController,
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
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(17),
                    boxShadow: [
                      BoxShadow(
                        color: myShadows[6],
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: eventDescriptionController,
                    maxLength: 200,
                    minLines: 1,
                    maxLines: 13,
                    style: TextStyle(
                      color: myColors[3],
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
                            color: Color(0xffffffff),
                            boxShadow: [
                              BoxShadow(
                                color: myShadows[6],
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 25, horizontal: 10),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Date: ${_date.day}.${_date.month}.${_date.year}",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: myColors[2]),
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
                            color: Color(0xffffffff),
                            boxShadow: [
                              BoxShadow(
                                color: myShadows[6],
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 25, horizontal: 10),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Time: ${_time.hour}:${_time.minute > 9 ? _time.minute : "0${_time.minute}"}",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: myColors[3]),
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
                              boxShadow: [
                                BoxShadow(
                                  color: myShadows[6],
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                  offset: Offset(0, 3),
                                ),
                              ],
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
                          borderRadius: BorderRadius.circular(21),
                          boxShadow: [
                            BoxShadow(
                              color: myShadows[6],
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Import header image",
                            style: TextStyle(color: myColors[5], fontSize: 17),
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
      ),
    );
  }
}
