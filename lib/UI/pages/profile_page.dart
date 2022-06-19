// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:redhopper_app/UI/pages/edit_profile_page.dart';
import 'package:redhopper_app/UI/widgets/homepage_shimmer.dart';
import 'package:redhopper_app/core/enums/view_state.dart';
import 'package:redhopper_app/core/services/endpoints.dart';
import 'package:redhopper_app/core/view_models/profile_viewmodel.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
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
      body: ChangeNotifierProvider<ProfileInfoViewModel>(
        create: (context) => ProfileInfoViewModel()..getuserProfileData(),
        child: Consumer<ProfileInfoViewModel>(
          builder: (context, viewmodel, child) =>
              viewmodel.view_state == viewState.busy
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    chooseSource(viewmodel);
                                    // await viewmodel.getuserProfileImage();
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    backgroundImage: viewmodel.imageView == null
                                        ? NetworkImage(
                                                '''$baseUrl/$imageRoute/${viewmodel.userProfile!.data!.elementAt(0).relatedUser!.avatar}''')
                                            as ImageProvider
                                        : FileImage(viewmodel.imageView!),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      viewmodel.userProfile!.data!
                                              .elementAt(0)
                                              .relatedUser!
                                              .firstName
                                              .toString() +
                                          " " +
                                          viewmodel.userProfile!.data!
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
                                IconButton(
                                  icon: Icon(
                                    Icons.edit_outlined,
                                  ),
                                  color: Colors.lightBlue,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => EditProfilePage(
                                            userProfile: viewmodel.userProfile,
                                          ),
                                        ));
                                  },
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
                                    'Personal Information',
                                    style: TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Container(
                              // padding: EdgeInsets.all(14),
                              child: Column(
                                children: [
                                  Row(
                                    children: const [
                                      Text('First Name'),
                                    ],
                                  ),
                                  SizedBox(height: 06),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                      color: Color(0xFFD6E4FF),
                                    ),
                                    padding: EdgeInsets.fromLTRB(6, 12, 6, 12),
                                    child: Row(
                                      children: [
                                        Text(viewmodel.userProfile!.data!
                                            .elementAt(0)
                                            .relatedUser!
                                            .firstName
                                            .toString()),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: const [
                                      Text('Last Name'),
                                    ],
                                  ),
                                  SizedBox(height: 06),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                      color: Color(0xFFD6E4FF),
                                    ),
                                    padding: EdgeInsets.fromLTRB(6, 12, 6, 12),
                                    child: Row(
                                      children: [
                                        Text(viewmodel.userProfile!.data!
                                            .elementAt(0)
                                            .relatedUser!
                                            .lastName
                                            .toString()),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: const [
                                      Text('Email Address'),
                                    ],
                                  ),
                                  SizedBox(height: 06),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                      color: Color(0xFFD6E4FF),
                                    ),
                                    padding: EdgeInsets.fromLTRB(6, 12, 6, 12),
                                    child: Row(
                                      children: [
                                        Text(viewmodel.userProfile!.data!
                                            .elementAt(0)
                                            .relatedUser!
                                            .email
                                            .toString()),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: const [
                                      Text('Address'),
                                    ],
                                  ),
                                  SizedBox(height: 06),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                      color: Color(0xFFD6E4FF),
                                    ),
                                    padding: EdgeInsets.fromLTRB(6, 12, 6, 12),
                                    child: Row(
                                      children: [
                                        Text(viewmodel.userProfile!.data!
                                            .elementAt(0)
                                            .address
                                            .toString()),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: const [
                                      Text('Gender'),
                                    ],
                                  ),
                                  SizedBox(height: 06),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                      color: Color(0xFFD6E4FF),
                                    ),
                                    padding: EdgeInsets.fromLTRB(6, 12, 6, 12),
                                    child: Row(
                                      children: [
                                        Text(viewmodel.userProfile!.data!
                                            .elementAt(0)
                                            .gender
                                            .toString()),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: const [
                                      Text('Nationality'),
                                    ],
                                  ),
                                  SizedBox(height: 06),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                      color: Color(0xFFD6E4FF),
                                    ),
                                    padding: EdgeInsets.fromLTRB(6, 12, 6, 12),
                                    child: Row(
                                      children: [
                                        Text(viewmodel.userProfile!.data!
                                            .elementAt(0)
                                            .nationality
                                            .toString()),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: const [
                                      Text('Phone Number'),
                                    ],
                                  ),
                                  SizedBox(height: 06),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                      color: Color(0xFFD6E4FF),
                                    ),
                                    padding: EdgeInsets.fromLTRB(6, 12, 6, 12),
                                    child: Row(
                                      children: [
                                        Text(viewmodel.userProfile!.data!
                                            .elementAt(0)
                                            .phoneNumber
                                            .toString()),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: const [
                                      Text('Emergency Contact'),
                                    ],
                                  ),
                                  SizedBox(height: 06),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                      color: Color(0xFFD6E4FF),
                                    ),
                                    padding: EdgeInsets.fromLTRB(6, 12, 6, 12),
                                    child: Row(
                                      children: [
                                        Text(viewmodel.userProfile!.data!
                                            .elementAt(0)
                                            .emergencyContactNumber
                                            .toString()),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
        ),
      ),
    );
  }

  void chooseSource(ProfileInfoViewModel viewModel) {
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(content: Text("Choose image source"), actions: [
        TextButton(
          child: Text(
            "Camera",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () async {
            await viewModel.getuserCameraProfileImage();
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: Text(
            "Gallery",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () async {
            await viewModel.getuserGalleryProfileImage();
            Navigator.pop(context);
          },
        ),
      ]),
    );
  }
}
