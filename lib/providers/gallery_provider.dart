import 'package:flutter/material.dart';
import 'package:photo_gallery_pagination/models/photo.dart';
import 'package:photo_gallery_pagination/services/api_service.dart';

class GalleryProvider extends ChangeNotifier {
  List<Photo> _photos = [];
  int _page = 1;
  bool _isLoading = false;
  final ApiService _apiService = ApiService();

  List<Photo> get photos => _photos;
  bool get isLoading => _isLoading;

  Future<void> fetchPhotos() async {
    if (_isLoading) return;

    _isLoading = true;
    notifyListeners();

    try {
      final newPhotos = await _apiService.fetchPhotos(_page);
      _photos.addAll(newPhotos);
      _page++;
    } catch (e) {
      // Handle error (e.g., show a snackbar)
      print('Error fetching photos: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
}
