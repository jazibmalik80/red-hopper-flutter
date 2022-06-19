import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:redhopper_app/core/enums/view_state.dart';
import 'package:redhopper_app/core/models/user_profile_model.dart';
import 'package:redhopper_app/core/services/user_profile_service.dart';
import 'package:redhopper_app/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileInfoViewModel extends ChangeNotifier {
  UserProfileService userProfileService = locator<UserProfileService>();

  viewState view_state = viewState.idle;
  UserProfile? userProfile;
  File? imageView;

  Future<UserProfile?> getuserProfileData() async {
    view_state = viewState.busy;
    notifyListeners();

    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    String loggedInUserToken = sharedPref.getString("access_token") ?? "";
    userProfile = await userProfileService.getProfileInfo(loggedInUserToken);

    view_state = viewState.idle;
    notifyListeners();
  }

  Future getuserGalleryProfileImage() async {
    imageView = await userProfileService.getGalleryImage();
    print('Below is ImageView');
    print(imageView);
    notifyListeners();
  }

  Future getuserCameraProfileImage() async {
    imageView = await userProfileService.getCameraImage();
    print('Below is ImageView');
    print(imageView);

    notifyListeners();
  }

  Future updateProfileInfo({
    required String profileID1,
    required String profileID2,
    required String profilefirstName,
    required String profilelastName,
    required String profileEmail,
    required String profileAddress,
    required String profileGender,
    required String profileNationality,
    required String profilePhone,
    required String profileEmergencyPhone,
  }) async {
    view_state = viewState.busy;
    notifyListeners();

    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    String loggedInUserToken = sharedPref.getString("access_token") ?? "";

    userProfile = await userProfileService.editProfileInfo(
      token: loggedInUserToken,
      profileID1: profileID1,
      profileID2: profileID2,
      profilefirstName: profilefirstName,
      profilelastName: profilelastName,
      profileEmail: profileEmail,
      profileAddress: profileAddress,
      profileGender: profileGender,
      profileNationality: profileNationality,
      profilePhone: profilePhone,
      profileEmergencyPhone: profileEmergencyPhone,
    );

    view_state = viewState.idle;
    notifyListeners();
  }
}
