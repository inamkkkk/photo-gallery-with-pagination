import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:photo_gallery_pagination/models/photo.dart';

class ApiService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com/photos';
  static const int _limit = 20;

  Future<List<Photo>> fetchPhotos(int page) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl?_page=$page&_limit=$_limit'));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => Photo.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load photos: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load photos: $e');
    }
  }
}
