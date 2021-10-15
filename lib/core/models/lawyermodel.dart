class Lawyer {
  String id,
      name,
      email,
      phone,
      seniorityLevel,
      officePhoneNumber,
      officeAddress,
      about;
  Fees fees;
  List<Education> education;
  List<Certifcate> certifcates;
  List<Trainingcourses> trainingcourses;
  List<DaysOfTheWeek> daysoftheweek;
  List<String> specialization;
  List<String> spokenlanguage;

  // List replyes, likedby;
  Lawyer(
      this.id,
      this.name,
      this.email,
      this.phone,
      this.seniorityLevel,
      this.officePhoneNumber,
      this.officeAddress,
      this.education,
      this.certifcates,
      this.trainingcourses,
      this.daysoftheweek,
      this.specialization,
      this.about,
      this.spokenlanguage,
      this.fees);
  factory Lawyer.fromJson(Map<String, dynamic> json) {
    return Lawyer(
        json["_id"],
        json["party"]["username"],
        json["party"]["email"],
        json["party"]["phone"].toString(),
        json["profile"]["seniorityLevel"],
        json["profile"]["officePhoneNumber"].toString(),
        json["profile"]["officeAddress"],
        json["profile"]["education"]
            .map<Education>((dynamic item) => Education.fromJson(item))
            .toList(),
        json["profile"]["certificates"]
            .map<Certifcate>((dynamic item) => Certifcate.fromJson(item))
            .toList(),
        json["profile"]["trainingCourses"]
            .map<Trainingcourses>(
                (dynamic item) => Trainingcourses.fromJson(item))
            .toList(),
        json["profile"]["daysOfTheWeek"]
            .map<DaysOfTheWeek>((dynamic item) => DaysOfTheWeek.fromJson(item))
            .toList(),
        json["profile"]["specialization"]
            .map<String>((dynamic item) => item.toString())
            .toList(),
        json["profile"]["about"].toString(),
        json["profile"]["spokenLanguages"]
            .map<String>((dynamic item) => item.toString())
            .toList(),
        Fees.fromJson(json["profile"]["fees"])
        // json['likedBy'].toList(),
        );
  }
  Map<String, dynamic> tojson() {
    Map<String, dynamic> json;

    json["_id"] = id;
    json["party"]["username"] = name;
    json["party"]["email"] = email;
    json["party"]["phone"] = phone;
    json["profile"]["seniorityLevel"] = seniorityLevel;
    json["profile"]["officePhoneNumber"] = officePhoneNumber;
    json["profile"]["officeAddress"] = officeAddress;

    json["profile"]["education"] =
        this.education.map((v) => v.tojson()).toList();
    json["profile"]["certificates"] =
        certifcates.map<Certifcate>((item) => item.tojson()).toList();
    json["profile"]["trainingCourses"] =
        trainingcourses.map<Trainingcourses>((item) => item.toJson()).toList();
    json["profile"]["daysOfTheWeek"] =
        daysoftheweek.map<DaysOfTheWeek>((item) => item.toJson()).toList();
    json["profile"]["specialization"] =
        specialization.map<String>((dynamic item) => item.toString()).toList();

    return json;
    // json['likedBy'].toList();
  }
}

class Education {
  String id, school, degree, startDate, endDate, grade;
  // List replyes, likedby;
  Education(
      {this.school,
      this.degree,
      this.startDate,
      this.endDate,
      this.grade,
      this.id});
  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(
      id: json["_id"],
      school: json["school"],
      degree: json["degree"],
      startDate: json["startDate"],
      endDate: json["endDate"],
      grade: json["grade"],
      // json["replies"].map((dynamic item) => Reply.fromJson(item)).toList(),
      // json['likedBy'].toList(),
    );
  }
  Map<String, dynamic> tojson() {
    Map<String, dynamic> json;

    json["_id"] = id;
    json["school"] = school;
    json["degree"] = degree;
    json["startDate"] = startDate;
    json["endDate"] = endDate;
    json["grade"] = grade;
    // json["replies"].map((dynamic item) => Reply.fromJson(item)).toList(),
    // json['likedBy'].toList(),
    return json;
  }
}

class Certifcate {
  String certificate, certificateProvider, date, id;
  // List replyes, likedby;
  Certifcate({
    this.certificate,
    this.certificateProvider,
    this.date,
    this.id,
  });
  factory Certifcate.fromJson(Map<String, dynamic> json) {
    return Certifcate(
      id: json["_id"],
      certificate: json["certificate"],
      certificateProvider: json["certificateProvider"],
      date: json["date"],

      // json["replies"].map((dynamic item) => Reply.fromJson(item)).toList(),
      // json['likedBy'].toList(),
    );
  }

  tojson() {
    Map<String, dynamic> json;

    json["_id"] = id;
    json["certificate"] = certificate;
    json["certificateProvider"] = certificateProvider;
    json["date"] = date;

    // json["replies"].map((dynamic item) => Reply.fromJson(item)).toList(),
    // json['likedBy'].toList(),
  }
}

class Trainingcourses {
  String id, courseName;
  // List replyes, likedby;
  Trainingcourses({
    this.courseName,
    this.id,
  });
  factory Trainingcourses.fromJson(Map<String, dynamic> json) {
    return Trainingcourses(
      id: json["_id"],
      courseName: json["courseName"],
    );
  }
  toJson() {
    Map<String, dynamic> json;

    json["_id"] = id;
    json["courseName"] = courseName;
  }
}

class DaysOfTheWeek {
  String day, officeHours, from, to, id;
  // List replyes, likedby;
  DaysOfTheWeek({this.day, this.officeHours, this.from, this.to, this.id});
  factory DaysOfTheWeek.fromJson(Map<String, dynamic> json) {
    return DaysOfTheWeek(
      day: json["day"],
      officeHours: json["officeHours"].toString(),
      from: json["from"],
      to: json["to"],
      id: json["_id"],

      // json["replies"].map((dynamic item) => Reply.fromJson(item)).toList(),
      // json['likedBy'].toList(),
    );
  }
  toJson() {
    Map<String, dynamic> json;

    json["day"] = day;
    json["officeHours"] = officeHours;
    json["from"] = from;
    json["to"] = to;
    json["_id"] = id;
    // json["replies"].map((dynamic item) => Reply.fromJson(item)).toList(),
    // json['likedBy'].toList(),
  }
}

class Fees {
  String meeting30min, meeting60min, call60min, call30min;
  // List replyes, likedby;
  Fees({this.meeting30min, this.meeting60min, this.call60min, this.call30min});
  factory Fees.fromJson(Map<String, dynamic> json) {
    return Fees(
      meeting30min: json["meeting30min"].toString(),
      meeting60min: json["meeting60min"].toString(),
      call60min: json["call60min"].toString(),
      call30min: json["call30min"].toString(),

      // json["replies"].map((dynamic item) => Reply.call60minJson(item)).toList(),
      // json['likedBy'].toList(),
    );
  }
  toJson() {
    Map<String, dynamic> json;

    json["meeting30min"] = meeting30min;
    json["meeting60min"] = meeting60min;
    json["call60min"] = call60min;
    json["call30min"] = call30min;
    // json["replies"].map((dynamic item) => Reply.fromJson(item)).toList(),
    // json['likedBy'].toList(),
  }
}
