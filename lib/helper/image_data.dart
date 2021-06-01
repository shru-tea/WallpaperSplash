import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:wallpaper_app/model/wallpaper_model.dart';

String apiKey = '563492ad6f91700001000001bd1449e16a0f4bdf89b60d495c8ad272';

class WallpaperImages {
  List<WallpaperModel> wallpapers = [];
  var trendingWallpapers;
  Future<void> getSearchedWallpapers({String query}) async {
    http.Response response = await http.get(
        'https://api.pexels.com/v1/search?query=$query&per_page=100&page=1',
        headers: {'Authorization': apiKey});
    if (response.statusCode == 200) {
      Map<String, dynamic> trendingWallpapers = jsonDecode(response.body);
      trendingWallpapers["photos"].forEach((element) {
        //print(element);
        if (element["photographer_url"] != null) {
          WallpaperModel wallpaperModel = WallpaperModel();
          wallpaperModel = WallpaperModel.fromMap(element);
          wallpapers.add(wallpaperModel);
        }
      });
    } else {
      print(response.statusCode);
    }
  }

  Future<void> getTrendingWallpapers() async {
    http.Response response = await http.get(
        'https://api.pexels.com/v1/curated?per_page=100&page=1',
        headers: {'Authorization': apiKey});
    //print(response.body.toString());
    if (response.statusCode == 200) {
      Map<String, dynamic> trendingWallpapers = jsonDecode(response.body);
      trendingWallpapers["photos"].forEach((element) {
        //print(element);
        if (element["photographer_url"] != null) {
          WallpaperModel wallpaperModel = WallpaperModel();
          wallpaperModel = WallpaperModel.fromMap(element);
          wallpapers.add(wallpaperModel);
        }
      });
    } else {
      print(response.statusCode);
    }
  }
}
