import 'package:flutter_news_app/src/helpers/constants.dart';
import 'package:flutter_news_app/src/models/newsResponseModel.dart';
import 'package:http/http.dart' as http;

class NewsApiProvider {
  final http.Client client = http.Client();
  final String _apiKey = Constant.newsApiKey;

  Future<List<Article>> fetchNewsList({String category = ''}) async {
    final url = Uri.parse(
      '${Constant.baseUrl}${Constant.topHeadLine}?country=in&apiKey=$_apiKey&category=$category',
    );

    final response = await client.get(url);

    if (response.statusCode == 200) {
      final newsResponse = NewsApiResponse.fromRawJson(response.body);
      // ✅ Safely handle nullable 'articles'
      return newsResponse.articles ?? [];
    } else {
      throw Exception('Failed to load news');
    }
  }
}
