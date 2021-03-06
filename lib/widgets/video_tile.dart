import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/blocs/favorite_bloc.dart';
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
              StreamBuilder<Map<String, Video>>(
                stream: BlocProvider
                    .of<FavoriteBloc>(context)
                    .outFav,
                initialData: {},
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return IconButton(
                      icon: Icon(snapshot.data.containsKey(video.id)
                          ? Icons.star
                          : Icons.star_border),
                      color: Colors.white,
                      iconSize: 30.0,
                      onPressed: () {
                        BlocProvider.of<FavoriteBloc>(context).toggleFavorite(video);
                      },
                    );
                  }
                  else {
                    // ignore: missing_return
                    return CircularProgressIndicator();
                  }
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
