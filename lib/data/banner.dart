class BannerSlider{
  final int id;
  final String imageUrl;

  BannerSlider.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        imageUrl = json['image'];
}