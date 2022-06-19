// ignore_for_file: unnecessary_this, prefer_collection_literals, unnecessary_new

class UserProfile {
  List<Data>? data;

  UserProfile({this.data});

  UserProfile.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? status;
  String? sort;
  String? userCreated;
  String? dateCreated;
  String? userUpdated;
  String? dateUpdated;
  String? gender;
  String? dateOfBirth;
  String? phoneNumber;
  String? nationality;
  String? emergencyContactName;
  String? emergencyContactNumber;
  String? address;
  RelatedUser? relatedUser;

  Data(
      {this.id,
      this.status,
      this.sort,
      this.userCreated,
      this.dateCreated,
      this.userUpdated,
      this.dateUpdated,
      this.gender,
      this.dateOfBirth,
      this.phoneNumber,
      this.nationality,
      this.emergencyContactName,
      this.emergencyContactNumber,
      this.address,
      this.relatedUser});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    sort = json['sort'];
    userCreated = json['user_created'];
    dateCreated = json['date_created'];
    userUpdated = json['user_updated'];
    dateUpdated = json['date_updated'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    phoneNumber = json['phone_number'];
    nationality = json['nationality'];
    emergencyContactName = json['emergency_contact_name'];
    emergencyContactNumber = json['emergency_contact_number'];
    address = json['address'];
    relatedUser = json['related_user'] != null
        ? new RelatedUser.fromJson(json['related_user'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['sort'] = this.sort;
    data['user_created'] = this.userCreated;
    data['date_created'] = this.dateCreated;
    data['user_updated'] = this.userUpdated;
    data['date_updated'] = this.dateUpdated;
    data['gender'] = this.gender;
    data['date_of_birth'] = this.dateOfBirth;
    data['phone_number'] = this.phoneNumber;
    data['nationality'] = this.nationality;
    data['emergency_contact_name'] = this.emergencyContactName;
    data['emergency_contact_number'] = this.emergencyContactNumber;
    data['address'] = this.address;
    if (this.relatedUser != null) {
      data['related_user'] = this.relatedUser!.toJson();
    }
    return data;
  }
}

class RelatedUser {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? location;
  String? title;
  String? description;
  String? tags;
  String? avatar;
  String? language;
  String? theme;
  String? tfaSecret;
  String? status;
  String? role;
  String? token;
  String? lastAccess;
  String? lastPage;
  String? provider;
  String? externalIdentifier;
  String? authData;
  bool? emailNotifications;

  RelatedUser(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.location,
      this.title,
      this.description,
      this.tags,
      this.avatar,
      this.language,
      this.theme,
      this.tfaSecret,
      this.status,
      this.role,
      this.token,
      this.lastAccess,
      this.lastPage,
      this.provider,
      this.externalIdentifier,
      this.authData,
      this.emailNotifications});

  RelatedUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    password = json['password'];
    location = json['location'];
    title = json['title'];
    description = json['description'];
    tags = json['tags'];
    avatar = json['avatar'];
    language = json['language'];
    theme = json['theme'];
    tfaSecret = json['tfa_secret'];
    status = json['status'];
    role = json['role'];
    token = json['token'];
    lastAccess = json['last_access'];
    lastPage = json['last_page'];
    provider = json['provider'];
    externalIdentifier = json['external_identifier'];
    authData = json['auth_data'];
    emailNotifications = json['email_notifications'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['location'] = this.location;
    data['title'] = this.title;
    data['description'] = this.description;
    data['tags'] = this.tags;
    data['avatar'] = this.avatar;
    data['language'] = this.language;
    data['theme'] = this.theme;
    data['tfa_secret'] = this.tfaSecret;
    data['status'] = this.status;
    data['role'] = this.role;
    data['token'] = this.token;
    data['last_access'] = this.lastAccess;
    data['last_page'] = this.lastPage;
    data['provider'] = this.provider;
    data['external_identifier'] = this.externalIdentifier;
    data['auth_data'] = this.authData;
    data['email_notifications'] = this.emailNotifications;
    return data;
  }
}
