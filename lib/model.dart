// To parse this JSON data, do
//
//     final testCase = testCaseFromJson(jsonString);

import 'dart:convert';

TestCase testCaseFromJson(String str) => TestCase.fromJson(json.decode(str));

String testCaseToJson(TestCase data) => json.encode(data.toJson());

class TestCase {
    TestCase({
        required this.page,
        required this.perPage,
        required this.total,
        required this.totalPages,
        required this.data,
    });

    int page;
    int perPage;
    int total;
    int totalPages;
    List<Datum> data;

    factory TestCase.fromJson(Map<String, dynamic> json) => TestCase(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.id,
        required this.email,
        required this.firstName,
        required this.lastName,
        required this.avatar,
    });

    int id;
    String email;
    String firstName;
    String lastName;
    String avatar;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
    };
}
