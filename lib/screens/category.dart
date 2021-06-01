import 'package:flutter/material.dart';
import 'package:wallpaper_app/helper/image_data.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';
import 'package:wallpaper_app/screens/local_widgets/wallpaperTile.dart';
import 'package:wallpaper_app/utils/ourAppBar.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({this.categoryName});
  final String categoryName;
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<WallpaperModel> wallpapers = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getCategoryWallpapers();
  }

  void getCategoryWallpapers() async {
    WallpaperImages wallpaperImages = WallpaperImages();
    await wallpaperImages.getSearchedWallpapers(query: widget.categoryName);
    wallpapers = wallpaperImages.wallpapers;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appTitle(),
        elevation: 0.0,
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 15.0,
              ),
              wallpaperList(wallpapers: wallpapers, context: context)
            ],
          ),
        ),
      ),
    );
  }
}
