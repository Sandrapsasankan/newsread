import 'dart:convert';
import 'package:newsread/models/article.dart';
import 'package:http/http.dart' as http;


class ApiService{
  Future<List<Article>> getArticle() async{
    final url="https://newsapi.org/v2/everything?q=bitcoin&apiKey=834da203a65646e2b6e67e4ed42894ff";

    var response=await http.get(Uri.parse(url));
    if(response.statusCode==200){
      var body=json.decode(response.body);

      List<Article> _data=List<Article>.from(
          body['articles'].map((e) => Article.fromJson(e)).toList());
      return _data;
    }
    else{
      List<Article> _data = [];
      return _data;
    }
  }
}