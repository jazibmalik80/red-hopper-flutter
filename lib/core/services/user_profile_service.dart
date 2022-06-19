import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:redhopper_app/core/models/user_profile_model.dart';
import 'package:redhopper_app/core/services/endpoints.dart';
import 'package:redhopper_app/core/services/payload.dart';

class UserProfileService {
  final ImagePicker picker = ImagePicker();

  Payload payload = Payload(
    'ParticipantProfile',
    {
      "related_user": {"_eq": "0334f108-153f-40af-a3da-b86b9bd310fe"}
    },
    'related_user.*,*',
    "",
  );

  Future<UserProfile?> getProfileInfo(String token) async {
    Response response = await get(
      Uri.parse(
          '''http://54.153.186.154/items/ParticipantProfile?filter={"related_user": {"_eq": "0334f108-153f-40af-a3da-b86b9bd310fe"}}&fields=related_user.*,*'''),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );

    if (response.statusCode == 200) {
      return UserProfile.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  // Future<UserProfile?> getProfileInfoTo(String token, Payload payload) async {
  //   Response response = await get(
  //     Uri.parse(
  //         '''http://54.153.186.154/items/${payload.model}?filter=${payload.filters}&fields=${payload.fields}'''),
  //     headers: {
  //       "Content-Type": "application/json",
  //       "Authorization": "Bearer $token"
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     return UserProfile.fromJson(jsonDecode(response.body));
  //   } else {
  //     return null;
  //   }
  // }

  Future editProfileInfo({
    required String token,
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
    print(token);
    print(profileID1);
    print(profileID2);
    print(profilefirstName);
    print(profilelastName);
    print(profileEmail);
    print(profileAddress);
    print(profileGender);
    print(profileNationality);
    print(profilePhone);
    print(profileEmergencyPhone);

    Response editProfileResponse1 = await patch(
        Uri.parse('''$baseUrl/$routeParticipantProfile/$profileID1'''),
        headers: {
          "Authorization": "Bearer $token"
        },
        body: {
          "gender": profileGender,
          "phone_number": profilePhone,
          "nationality": profileNationality,
          "emergency_contact_number": profileEmergencyPhone,
          "address": profileAddress
        });
    print(editProfileResponse1.statusCode);
    print(editProfileResponse1.body);
    print('1st Api Call Executed');

    Response editProfileResponse2 = await patch(
        Uri.parse('''http://54.153.186.154/users/$profileID2'''),
        headers: {
          "Authorization": "Bearer $token"
        },
        body: {
          "first_name": profilefirstName,
          "last_name": profilelastName,
          "email": profileEmail
        });
    print(editProfileResponse2.statusCode);
    print(editProfileResponse1.body);
    print('2nd Api Call Executed');
  }

  Future<File> getGalleryImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    File pickedImage = File(image!.path);
    return pickedImage;
  }

  Future<File> getCameraImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    File pickedImage = File(image!.path);
    return pickedImage;
  }
}
