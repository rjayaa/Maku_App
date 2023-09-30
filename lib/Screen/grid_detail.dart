import 'package:flutter/material.dart';
import 'package:maku_app/model/photo.dart';

class GridDetails extends StatefulWidget {
  final Photo photo;
  GridDetails({required this.photo});

  @override
  State<GridDetails> createState() => _GridDetailsState();
}

class _GridDetailsState extends State<GridDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: "image${widget.photo.id}",
              child: FadeInImage.assetNetwork(
                placeholder: "assets/pp1.jpg",
                image: widget.photo.url ?? "assets/pp1.",
              ),
            ),
            SizedBox(height: 30),
            OutlinedButton(
              child: Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
    );
  }
}
