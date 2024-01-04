class WallpaperDataModel {
  String? next_page;
  int? page;
  int? per_page;
  int? total_results;
  List<PhotoModel>? photos;

  WallpaperDataModel({required this.next_page,
    required this.page,
    required this.per_page,
    required this.total_results,
    required this.photos});

  factory WallpaperDataModel.fromJson(Map<String, dynamic> json){
    List<PhotoModel> listData = [];

    for(Map<String, dynamic> eachPhoto in json['photos']){
      listData.add(PhotoModel.fromJson(eachPhoto));
    }

    return WallpaperDataModel(
        next_page: json['next_page'],
        page: json['page'],
        per_page: json['per_page'],
        total_results: json['total_results'],
        photos: listData);
  }
}

class PhotoModel {
  String? alt;
  String? avg_color;
  String? photographer;
  String? photographer_url;
  String? url;
  int? height;
  int? id;
  bool? liked;
  int? photographer_id;
  int? width;
  SrcModel? src;

  PhotoModel({required this.alt,
    required this.avg_color,
    required this.photographer,
    required this.photographer_url,
    required this.url,
    required this.height,
    required this.id,
    required this.liked,
    required this.photographer_id,
    required this.width,
    required this.src});

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
        alt: json['alt'],
        avg_color: json['avg_color'],
        photographer: json['photographer'],
        photographer_url: json['photographer_url'],
        url: json['url'],
        height: json['height'],
        id: json['id'],
        liked: json['liked'],
        photographer_id: json['photographer_id'],
        width: json['width'],
        src: SrcModel.fromJson(json['src']));
  }
}

class SrcModel {
  String? landscape;
  String? large;
  String? large2x;
  String? medium;
  String? original;
  String? portrait;
  String? small;
  String? tiny;

  SrcModel({required this.landscape,
    required this.large,
    required this.large2x,
    required this.medium,
    required this.original,
    required this.portrait,
    required this.small,
    required this.tiny});

  factory SrcModel.fromJson(Map<String, dynamic> json) {
    return SrcModel(
        landscape: json['landscape'],
        large: json['large'],
        large2x: json['large2x'],
        medium: json['medium'],
        original: json['original'],
        portrait: json['portrait'],
        small: json['small'],
        tiny: json['tiny']);
  }
}
