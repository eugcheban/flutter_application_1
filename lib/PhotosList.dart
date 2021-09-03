import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/FetchPhotos.dart';

class Album extends StatelessWidget {
  const Album({Key? key, required this.photos}) : super(key: key);

  final List<Photo> photos;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: photos.length,
        itemBuilder: (context, index) {
          return Center(
            child: Card(
              child: Column(
                children: <Widget>[
                  GestureDetector(
                      child: Hero(
                          tag: photos[index].urlSmall,
                          child: Image.network(photos[index].urlSmall,
                              fit: BoxFit.cover,
                              height: 100,
                              width: 100,
                              alignment: Alignment.center)),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return DetailScreen(photos[index].urlBig);
                        }));
                      }),
                  Container(
                    child: ListTile(
                      title: Text(photos[index].username,
                          style: TextStyle(fontSize: 10)),
                      subtitle: Text(photos[index].bio,
                          style: TextStyle(fontSize: 8)),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}

class PhotosList extends StatelessWidget {
  const PhotosList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PhotosList'),
      ),
      body: FutureBuilder<List<Photo>>(
        future: fetchPhotos(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return Album(photos: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
