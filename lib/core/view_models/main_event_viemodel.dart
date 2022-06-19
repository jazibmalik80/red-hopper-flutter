// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:redhopper_app/core/enums/view_state.dart';
import 'package:redhopper_app/core/models/event_model.dart';
import 'package:redhopper_app/core/services/event_service.dart';
import 'package:redhopper_app/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainEventViewModel extends ChangeNotifier {
  EventService eventService = locator<EventService>();

  viewState view_state = viewState.idle;
  EventModelList? eventModel;

  Future<EventModelList?> getEventData() async {
    view_state = viewState.busy;
    notifyListeners();

    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    String loggedInUserToken = sharedPref.getString("access_token") ?? "";
    eventModel = await eventService.getUpcommingEvents(loggedInUserToken);

    view_state = viewState.idle;
    notifyListeners();
  }
}
