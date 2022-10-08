import 'dart:convert';

import 'package:flutter/services.dart';

class DataOperation {
  Future<Map<String, dynamic>> readEventJsonFile() async {
    String loadData =
        await rootBundle.loadString("assets/event/transition.json");
    Map<String, dynamic> jsonResponse = json.decode(loadData);
    return jsonResponse;
  }

  findEventIdObject(int id) async {
    Map<String, dynamic> json = await readEventJsonFile();
    for (var eventsItem in json["events"]) {
      print(eventsItem["event_id"]);

      if (id == eventsItem["event_id"]) print(eventsItem["objects"]);
      // for (var objectsItem in eventsItem["objects"]) {
      //   print(objectsItem);
      // }
    }
  }
}
