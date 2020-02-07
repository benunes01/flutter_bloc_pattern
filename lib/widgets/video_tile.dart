import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/models/video.dart';

class VideoTile extends StatelessWidget {
  final Video video;

  VideoTile(this.video);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16.0 / 9.0,
            child: Image.network(
              video.thumb,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child: Text(
                        video.title,
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child: Text(
                        video.channel,
                        style: TextStyle(color: Colors.white, fontSize: 15.0),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.star_border),
                color: Colors.white,
                iconSize: 30.0,
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}
