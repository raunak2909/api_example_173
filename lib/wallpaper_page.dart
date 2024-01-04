import 'dart:convert';

import 'package:api_example_173/WallpaperDataModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as httpClient;

class WallpaperPage extends StatefulWidget {
  const WallpaperPage({super.key});

  @override
  State<WallpaperPage> createState() => _WallpaperPageState();
}

class _WallpaperPageState extends State<WallpaperPage> {
  WallpaperDataModel? mData;

  @override
  void initState() {
    super.initState();
    getSearchWallpaper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallpaper'),
      ),
      body: mData !=null && mData!.photos!.isNotEmpty ?
      GridView.builder(
        itemCount: mData!.photos!.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 11,
            crossAxisSpacing: 11,
            childAspectRatio: 9/16
          ),
        itemBuilder: (_, index){
          var eachPhoto = mData!.photos![index].src!.portrait!;
          return Image.network(eachPhoto, fit: BoxFit.fill,);
        },
      ) : Container(
        child: Center(
          child: Text('No Wallpaper!!'),
        ),
      ),
    );
  }
  
  void getSearchWallpaper({String query = "nature"}) async{
    var mApiKey = "IsdZkUsWondOOmqNkNSFGtBuaoRofOkF8VKuftMElAFV4KDCD2Bi5rPr";
    var uri = Uri.parse("https://api.pexels.com/v1/search?query=$query");

    var response = await httpClient.get(uri, headers: {
      "Authorization" : mApiKey
    });

    if(response.statusCode==200){
      var rawData = jsonDecode(response.body);
      mData = WallpaperDataModel.fromJson(rawData);
      setState(() {

      });
    }
  }
}
