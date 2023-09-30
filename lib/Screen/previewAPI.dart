import 'package:flutter/material.dart';
import 'package:maku_app/Screen/grid_cell.dart';
import 'package:maku_app/Screen/grid_detail.dart';
import 'package:maku_app/model/photo.dart';
import 'package:maku_app/network/network_request.dart';

class PracticePreviewAPI extends StatefulWidget {
  const PracticePreviewAPI({super.key});

  @override
  State<PracticePreviewAPI> createState() => _PracticePreviewAPIState();
}

class _PracticePreviewAPIState extends State<PracticePreviewAPI> {
  circularProgress() {
    return Center(child: CircularProgressIndicator());
  }

  gridView(AsyncSnapshot<List<Photo>> snapshot) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: (snapshot.data ?? []).map((photo) {
          return GestureDetector(
            child: GridTile(
              child: PhotoCell(photo),
            ),
            onTap: () {
              gotoDetailPage(context, photo);
            },
          );
        }).toList(),
      ),
    );
  }

  gotoDetailPage(BuildContext context, Photo photo) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => GridDetails(photo: photo),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
              child: FutureBuilder<List<Photo>>(
            future: NetworkRequest.fetchPhotos(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error ${snapshot.error}');
              } else if (snapshot.hasData) {
                return gridView(snapshot);
              }
              return circularProgress();
            },
          ))
        ],
      ),
    );
  }
}
