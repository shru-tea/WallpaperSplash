import 'package:flutter/material.dart';
import 'package:wallpaper_app/helper/image_data.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';
import 'package:wallpaper_app/utils/ourAppBar.dart';

import 'local_widgets/wallpaperTile.dart';

class SearchBar extends StatefulWidget {
  SearchBar({this.categoryName});
  final String categoryName;
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController searchController = TextEditingController();
  List<WallpaperModel> wallpapers = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getSearchedForWallpapers();
    searchController.text = widget.categoryName;
  }

  void getSearchedForWallpapers() async {
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
            //child: Icon(Icons.favorite),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                            hintText: 'search wallpaper',
                            border: InputBorder.none),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchBar(
                                categoryName: searchController.text,
                              ),
                            ));
                      },
                      child: Icon(
                        Icons.search,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              wallpaperList(wallpapers: wallpapers, context: context)
            ],
          ),
        ),
      ),
    );
  }
}
