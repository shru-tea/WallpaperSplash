import 'package:flutter/material.dart';
import 'package:wallpaper_app/screens/category.dart';
import 'package:wallpaper_app/utils/constants.dart';

class CategoryListView extends StatelessWidget {
  CategoryListView({@required this.imageUrl, @required this.categoryTitle});
  final String imageUrl;
  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryPage(
                      categoryName: categoryTitle.toLowerCase(),
                    )));
      },
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.only(right: 5.0),
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  height: 50.0,
                  width: 100.0,
                )),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.black26,
              ),
              height: 50.0,
              width: 100.0,
              alignment: Alignment.center,
              child: Text(
                categoryTitle,
                style: kcategoryTileTitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
