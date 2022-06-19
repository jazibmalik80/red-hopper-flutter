import 'dart:convert';

import 'package:http/http.dart';
import 'package:redhopper_app/core/models/event_model.dart';
import 'package:redhopper_app/core/services/endpoints.dart';

class EventService {
  Future<EventModelList?> getAllEvents(String token) async {
    Response response = await get(
      Uri.parse('''$baseUrl/$routeEvents'''),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );

    if (response.statusCode == 200) {
      return EventModelList.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  Future<EventModelList?> getUpcommingEvents(String token) async {
    Response response = await get(
      Uri.parse('''$baseUrl/$routeEvents?sort=sort,start_date'''),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );

    if (response.statusCode == 200) {
      return EventModelList.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }
}
