class WallpaperModel {
  String photographer;
  String photographerUrl;
  int photographerId;
  //src is a map
  SrcModel src;

  WallpaperModel(
      {this.photographer, this.photographerId, this.photographerUrl, this.src});

  factory WallpaperModel.fromMap(Map<String, dynamic> trendingWallpapers) {
    return WallpaperModel(
      src: SrcModel.fromMap(trendingWallpapers["src"]),
      photographerUrl: trendingWallpapers["photographer_url"],
      photographer: trendingWallpapers["photographer"],
      photographerId: trendingWallpapers["photographer_id"],
    );
  }
}

class SrcModel {
  SrcModel({this.original, this.portrait, this.small});
  String original;
  String small;
  String portrait;

  factory SrcModel.fromMap(Map<String, dynamic> trendingWallpapers) {
    return SrcModel(
      original: trendingWallpapers["original"],
      portrait: trendingWallpapers["portrait"],
      small: trendingWallpapers["small"],
    );
  }
}
