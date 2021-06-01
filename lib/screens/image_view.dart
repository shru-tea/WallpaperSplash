import 'dart:typed_data';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageView extends StatefulWidget {
  ImageView({this.imageUrl, this.photographerName, this.photographerUrl});
  final String imageUrl;
  final String photographerName;
  final String photographerUrl;
  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  createAlertDialog(
      {BuildContext context, String photographerUrl, String photographerName}) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.grey[350],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            elevation: 1.0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              height: 100.0,
              width: 50.0,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Photographer\'s Information',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Color.fromARGB(255, 82, 90, 105)),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      widget.photographerName,
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      widget.photographerUrl,
                      style: TextStyle(fontSize: 14.0),
                    )
                    //CircleAvatar(
                    // backgroundImage: NetworkImage(widget.photographerUrl),
                    // radius: 20.0,
                    // )
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    //using hero animation
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: widget.imageUrl,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                widget.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: FlatButton(
                          //color: Colors.white,
                          onPressed: () {
                            createAlertDialog(
                                context: context,
                                photographerUrl: widget.photographerUrl,
                                photographerName: widget.photographerName);
                            //print('Icon is being clicked');
                          },
                          child: Icon(Icons.info,
                              color: Color.fromARGB(255, 82, 90, 105)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _save();
                          //Navigator.pop(context);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          margin: EdgeInsets.only(right: 30.0),
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 8.0),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.white54, width: 1.0),
                              borderRadius: BorderRadius.circular(30.0),
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 82, 90, 105),
                                  Color.fromARGB(255, 137, 141, 218),
                                ],
                              )),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Set wallpaper',
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 20.0),
                              ),
                              Text(
                                'Image will be saved in gallery',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 13.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 14.0,
                ),
                Text(
                  'Cancel',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                SizedBox(
                  height: 50.0,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _save() async {
    if (Platform.isAndroid) {
      await _askPermission();
    }
    var response = await Dio().get(widget.imageUrl,
        options: Options(responseType: ResponseType.bytes));
    final result =
        await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    print(result);
    Navigator.pop(context);
  }

  _askPermission() async {
    if (Platform.isIOS) {
      Map<PermissionGroup, PermissionStatus> permissions =
          await PermissionHandler()
              .requestPermissions([PermissionGroup.photos]);
    } else {
      PermissionStatus permission = await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.storage);
    }
  }
}
