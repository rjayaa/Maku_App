import 'package:flutter/material.dart';
import 'package:maku_app/model/photo.dart';

class PhotoCell extends StatelessWidget {
  @required
  final Photo photo;

  const PhotoCell(this.photo);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Hero(
                  tag: "images${photo.id}",
                  child: FadeInImage.assetNetwork(
                    placeholder: "assets/pp1.jpg",
                    image: photo.thumbnailUrl ?? "assets/pp1.jpg",
                    width: 100,
                    height: 100,
                  ),
                ),
              )),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  photo.title ?? "Undefined",
                  maxLines: 1,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
