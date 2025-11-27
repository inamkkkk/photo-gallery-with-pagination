class Photo {
  final String title;
  final String url;

  Photo({required this.title, required this.url});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      title: json['title'] ?? 'No Title',
      url: json['url'] ?? '',
    );
  }
}
