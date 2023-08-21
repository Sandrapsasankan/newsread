import 'package:newsread/models/source.dart';

class Article{
  Source? source;
  String? author;
  String? title;
  String? description;
  String? urlToImage;
  String? publishedAt;

  Article(
  {
    this.source,
    this.urlToImage,
    this.title,
    this.publishedAt,
    this.description,
    this.author
});
factory Article.fromJson(Map<String, dynamic> json){
  return Article(
    source: Source.fromJson(json['source']),
    urlToImage: json['urlToImage'],
    author: json['author'],
    title: json['title'],
    description: json['description'],
    publishedAt: json['publishedAt'],

  );
}

}