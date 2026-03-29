class Rocket {
  final String rocketId;
  final String imageUrl;
  Rocket({required this.rocketId, required this.imageUrl});

  factory Rocket.fromJson(Map<String, dynamic> json) {
    String fixImageUrl(String url) {
      if (url.contains('imgur.com') && !url.contains('i.imgur.com')) {
        final id = url.split('/').last.split('.').first;
        return 'https://i.imgur.com/$id.jpeg';
      }
      return url;
    }

    return Rocket(
      rocketId: json['rocket_id'] as String,
      imageUrl: fixImageUrl(json['flickr_images'][0] as String),
    );
  }
}
