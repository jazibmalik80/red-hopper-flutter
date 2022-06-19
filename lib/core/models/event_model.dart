// ignore_for_file: prefer_collection_literals, unnecessary_new, unnecessary_this

class EventModelList {
  List<EventData>? data;

  EventModelList({this.data});

  EventModelList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <EventData>[];
      json['data'].forEach((v) {
        data!.add(new EventData.fromJson(v));
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

class EventData {
  String? id;
  String? status;
  String? sort;
  String? userCreated;
  String? dateCreated;
  String? userUpdated;
  String? dateUpdated;
  String? country;
  String? startDate;
  String? endDate;
  String? city;
  String? mainPicture;
  String? title;
  String? eventStatus;
  String? venue;
  String? venueDetails;
  String? description;
  String? mainVideo;
  List<int>? allPictures;

  EventData(
      {this.id,
      this.status,
      this.sort,
      this.userCreated,
      this.dateCreated,
      this.userUpdated,
      this.dateUpdated,
      this.country,
      this.startDate,
      this.endDate,
      this.city,
      this.mainPicture,
      this.title,
      this.eventStatus,
      this.venue,
      this.venueDetails,
      this.description,
      this.mainVideo,
      this.allPictures});

  EventData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    sort = json['sort'];
    userCreated = json['user_created'];
    dateCreated = json['date_created'];
    userUpdated = json['user_updated'];
    dateUpdated = json['date_updated'];
    country = json['country'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    city = json['city'];
    mainPicture = json['main_picture'];
    title = json['title'];
    eventStatus = json['event_status'];
    venue = json['venue'];
    venueDetails = json['venue_details'];
    description = json['description'];
    mainVideo = json['main_video'];
    allPictures = json['all_pictures'].cast<int>();
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
    data['country'] = this.country;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['city'] = this.city;
    data['main_picture'] = this.mainPicture;
    data['title'] = this.title;
    data['event_status'] = this.eventStatus;
    data['venue'] = this.venue;
    data['venue_details'] = this.venueDetails;
    data['description'] = this.description;
    data['main_video'] = this.mainVideo;
    data['all_pictures'] = this.allPictures;
    return data;
  }
}



/*class EventModelList {
  List<Data>? data;

  EventModelList({this.data});

  EventModelList.fromJson(Map<String, dynamic> json) {
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
  String? country;
  String? startDate;
  String? endDate;
  String? city;
  String? mainPicture;
  String? title;
  String? description;
  List<int>? allPictures;

  Data(
      {this.id,
      this.status,
      this.sort,
      this.userCreated,
      this.dateCreated,
      this.userUpdated,
      this.dateUpdated,
      this.country,
      this.startDate,
      this.endDate,
      this.city,
      this.mainPicture,
      this.title,
      this.description,
      this.allPictures});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    sort = json['sort'];
    userCreated = json['user_created'];
    dateCreated = json['date_created'];
    userUpdated = json['user_updated'];
    dateUpdated = json['date_updated'];
    country = json['country'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    city = json['city'];
    mainPicture = json['main_picture'];
    title = json['title'];
    description = json['description'];
    allPictures = json['all_pictures'].cast<int>();
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
    data['country'] = this.country;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['city'] = this.city;
    data['main_picture'] = this.mainPicture;
    data['title'] = this.title;
    data['description'] = this.description;
    data['all_pictures'] = this.allPictures;
    return data;
  }
}*/
