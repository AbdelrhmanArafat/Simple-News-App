import 'dart:convert';

import 'package:api_application/model/article_model.dart';
import 'package:http/http.dart';

class ApiService {
  final String endpointurl =
      "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=05afaea4b1f34ce9a02d53732fbb880e";

  Future<List<Article>> getArticle() async {
    final Uri url = Uri.parse(endpointurl);
    Response response = await get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("can't get the Article");
    }
  }
}
