// To parse this JSON data, do:
//
//     final newsApiResponse = NewsApiResponse.fromRawJson(jsonString);

import 'dart:convert';
import 'package:intl/intl.dart';

class NewsApiResponse {
  final String? status;
  final int? totalResults;
  final List<Article>? articles;

  NewsApiResponse({
    this.status,
    this.totalResults,
    this.articles,
  });

  factory NewsApiResponse.fromRawJson(String str) =>
      NewsApiResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NewsApiResponse.fromJson(Map<String, dynamic> json) => NewsApiResponse(
        status: json["status"] as String?,
        totalResults: json["totalResults"] as int?,
        articles: json["articles"] == null
            ? []
            : List<Article>.from(
                (json["articles"] as List).map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": articles == null
            ? []
            : List<dynamic>.from(articles!.map((x) => x.toJson())),
      };
}

class Article {
  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Article.fromRawJson(String str) =>
      Article.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: json["source"] == null
            ? null
            : Source.fromJson(json["source"]),
        author: json["author"] as String?,
        title: json["title"] as String?,
        description: json["description"] as String?,
        url: json["url"] as String?,
        urlToImage: json["urlToImage"] as String?,
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.tryParse(json["publishedAt"]),
        content: json["content"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "source": source?.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt?.toIso8601String(),
        "content": content,
      };

  /// Format: 01 January 2024 3:45
  String getTime() {
    if (publishedAt == null) return "";
    final formatter = DateFormat('dd MMMM yyyy h:mm');
    return formatter.format(publishedAt!);
  }

  /// Format: 01 January 2024
  String getDateOnly() {
    if (publishedAt == null) return "";
    final formatter = DateFormat('dd MMMM yyyy');
    return formatter.format(publishedAt!);
  }
}

class Source {
  final String? id;
  final String? name;

  Source({
    this.id,
    this.name,
  });

  factory Source.fromRawJson(String str) =>
      Source.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] as String?,
        name: json["name"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
