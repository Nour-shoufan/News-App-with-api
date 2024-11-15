// To parse this JSON data, do
//
//     final artivcles = artivclesFromJson(jsonString);

import 'dart:convert';

Artivcles artivclesFromJson(String str) => Artivcles.fromJson(json.decode(str));

String artivclesToJson(Artivcles data) => json.encode(data.toJson());

class Artivcles {
    String status;
    int totalResults;
    List<Article> articles;

    Artivcles({
        required this.status,
        required this.totalResults,
        required this.articles,
    });

    factory Artivcles.fromJson(Map<String, dynamic> json) => Artivcles(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
    };
}

class Article {
    Source ?source;
    String? author;
    String ?title;
    String? description;
    String ?url;
    String? urlToImage;
    DateTime? publishedAt;
    String? content;

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

    factory Article.fromJson(Map<String, dynamic> json) => Article(
    
       source: Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"].toString(),
        description: json["description"].toString(),
        url: json["url"].toString(),
        // خطأ حط toString 
        urlToImage: json["urlToImage"],
        // publishedAt: DateTime.parse(json["publishedAt"].toString()),
        content: json["content"].toString(),
    
    );



    Map<String, dynamic> toJson() => {
        // "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        // "publishedAt": publishedAt.toIso8601String(),
        "content": content,
    };
}

class Source {
    String? id;
    String name;

    Source({
        required this.id,
        required this.name,
    });

    @override
   String toString() {
    return 'Source{name: $name}';
  }
    factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
