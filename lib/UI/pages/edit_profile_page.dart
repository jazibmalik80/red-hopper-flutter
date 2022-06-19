// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redhopper_app/core/enums/view_state.dart';
import 'package:redhopper_app/core/models/user_profile_model.dart';
import 'package:redhopper_app/core/view_models/profile_viewmodel.dart';

class EditProfilePage extends StatefulWidget {
  final UserProfile? userProfile;
  const EditProfilePage({required this.userProfile});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController nationalityController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emergencyContactController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_outlined,
            ),
            color: Colors.black,
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image(
                      image: AssetImage(
                        "assets/event_dp.jpg",
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.userProfile!.data!
                                .elementAt(0)
                                .relatedUser!
                                .firstName
                                .toString() +
                            " " +
                            widget.userProfile!.data!
                                .elementAt(0)
                                .relatedUser!
                                .lastName
                                .toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "Joined 17 May 2021",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(thickness: 1),
              SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      color: Color(0xFFD6E4FF),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Personal Information",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: firstnameController
                        ..text = widget.userProfile?.data
                                ?.elementAt(0)
                                .relatedUser!
                                .firstName
                                .toString() ??
                            "Null",
                      decoration: InputDecoration(
                        labelText: 'First Name',
                        labelStyle: TextStyle(
                          color: Colors.grey[600],
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.fromLTRB(10, 15, 15, 15),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: lastnameController
                        ..text = widget.userProfile?.data
                                ?.elementAt(0)
                                .relatedUser!
                                .lastName
                                .toString() ??
                            "Null",
                      decoration: InputDecoration(
                        labelText: 'Last Name',
                        labelStyle: TextStyle(
                          color: Colors.grey[600],
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.fromLTRB(10, 15, 15, 15),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: emailController
                        ..text = widget.userProfile?.data
                                ?.elementAt(0)
                                .relatedUser!
                                .email
                                .toString() ??
                            "Null",
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        labelStyle: TextStyle(
                          color: Colors.grey[600],
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.fromLTRB(10, 15, 15, 15),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: addressController
                        ..text = widget.userProfile?.data
                                ?.elementAt(0)
                                .address
                                .toString() ??
                            "Null",
                      decoration: InputDecoration(
                        labelText: 'Address',
                        labelStyle: TextStyle(
                          color: Colors.grey[600],
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.fromLTRB(10, 15, 15, 15),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: genderController
                        ..text = widget.userProfile?.data
                                ?.elementAt(0)
                                .gender
                                .toString() ??
                            "Null",
                      decoration: InputDecoration(
                        labelText: 'Gender',
                        labelStyle: TextStyle(
                          color: Colors.grey[600],
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.fromLTRB(10, 15, 15, 15),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: nationalityController
                        ..text = widget.userProfile?.data
                                ?.elementAt(0)
                                .nationality
                                .toString() ??
                            "Null",
                      decoration: InputDecoration(
                        labelText: 'Nationality',
                        labelStyle: TextStyle(
                          color: Colors.grey[600],
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.fromLTRB(10, 15, 15, 15),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: phoneNumberController
                        ..text = widget.userProfile?.data
                                ?.elementAt(0)
                                .phoneNumber
                                .toString() ??
                            "Null",
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(
                          color: Colors.grey[600],
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.fromLTRB(10, 15, 15, 15),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: emergencyContactController
                        ..text = widget.userProfile?.data
                                ?.elementAt(0)
                                .emergencyContactNumber
                                .toString() ??
                            "Null",
                      decoration: InputDecoration(
                        labelText: 'Emergency Contact',
                        labelStyle: TextStyle(
                          color: Colors.grey[600],
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.fromLTRB(10, 15, 15, 15),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              ChangeNotifierProvider<ProfileInfoViewModel>(
                create: (context) => ProfileInfoViewModel(),
                child: Consumer<ProfileInfoViewModel>(
                  builder: (context, viewmodel, child) =>
                      viewmodel.view_state == viewState.busy
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : ElevatedButton(
                              child: Text('SAVE'),
                              onPressed: () async {
                                await viewmodel.updateProfileInfo(
                                  profileID1: widget.userProfile!.data!
                                      .elementAt(0)
                                      .id
                                      .toString(),
                                  profileID2: widget.userProfile!.data!
                                      .elementAt(0)
                                      .relatedUser!
                                      .id
                                      .toString(),
                                  profilefirstName: firstnameController.text,
                                  profilelastName: lastnameController.text,
                                  profileEmail: emailController.text,
                                  profileAddress: addressController.text,
                                  profileGender: genderController.text,
                                  profileNationality:
                                      nationalityController.text,
                                  profilePhone: phoneNumberController.text,
                                  profileEmergencyPhone:
                                      emergencyContactController.text,
                                );

                                final snackBar =
                                    SnackBar(content: Text('✔ Info Updated'));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                            ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
