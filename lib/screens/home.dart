import 'package:flutter/material.dart';
import 'package:wallpaper_app/data/category_data.dart';
import 'package:wallpaper_app/helper/image_data.dart';
import 'package:wallpaper_app/model/category_model.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';
import 'package:wallpaper_app/screens/local_widgets/wallpaperTile.dart';
import 'package:wallpaper_app/screens/search.dart';
import 'package:wallpaper_app/utils/ourAppBar.dart';

import 'local_widgets/categoryTile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categories = [];
  List<WallpaperModel> wallpapers = [];
  bool _loading = true;
  int _currentIndex = 0;
  TextEditingController searchController = TextEditingController();
  //WallpaperImages wallpaperImages = WallpaperImages();

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getWallpapers();
    //wallpaperImages.getTrendingWallpapers();
  }

  void getWallpapers() async {
    WallpaperImages wallpaperImages = WallpaperImages();
    await wallpaperImages.getTrendingWallpapers();
    wallpapers = wallpaperImages.wallpapers;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: appTitle(),
        elevation: 0.0,
        centerTitle: true,
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
                height: 10.0,
              ),
              Text(
                'Made with ❤',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.0),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                height: 80.0,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  itemCount: categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategoryListView(
                      imageUrl: categories[index].categoryImageUrl,
                      categoryTitle: categories[index].categoryName,
                    );
                  },
                ),
              ),
              wallpaperList(wallpapers: wallpapers, context: context)
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.amber[800],
        selectedFontSize: 16.0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[100],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_album),
            title: Text('Pictures'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_label),
            title: Text('Videos'),
          )
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
