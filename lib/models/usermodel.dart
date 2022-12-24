// // To parse this JSON data, do
// //
// //     final fulldetails = fulldetailsFromJson(jsonString);

// import 'dart:convert';

// List<Fulldetails> fulldetailsFromJson(String str) => List<Fulldetails>.from(
//     json.decode(str).map((x) => Fulldetails.fromJson(x)));

// String fulldetailsToJson(List<Fulldetails> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Fulldetails {
//   Fulldetails({
//     required this.albumId,
//     required this.id,
//     required this.title,
//     required this.url,
//     required this.thumbnailUrl,
//   });

//   int albumId;
//   int id;
//   String title;
//   String url;
//   String thumbnailUrl;

//   factory Fulldetails.fromJson(Map<String, dynamic> json) => Fulldetails(
//         albumId: json["albumId"],
//         id: json["id"],
//         title: json["title"],
//         url: json["url"],
//         thumbnailUrl: json["thumbnailUrl"],
//       );

//   Map<String, dynamic> toJson() => {
//         "albumId": albumId,
//         "id": id,
//         "title": title,
//         "url": url,
//         "thumbnailUrl": thumbnailUrl,
//       };
// }
