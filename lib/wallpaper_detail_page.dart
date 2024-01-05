import 'package:flutter/material.dart';

class WallPaperDetailPage extends StatelessWidget {
  String wallUrl;
  WallPaperDetailPage({required this.wallUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
          height: double.infinity,
          child: Image.network(wallUrl, fit: BoxFit.cover,)),
    );
  }
}
