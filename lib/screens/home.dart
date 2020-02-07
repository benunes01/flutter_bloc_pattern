import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/blocs/videos_bloc.dart';
import 'package:flutter_bloc_pattern/delegates/data_search.dart';
import 'package:flutter_bloc_pattern/widgets/video_tile.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Container(
            height: 100,
            child: Image.asset("images/youtube_PNG13.png"),
          ),
          elevation: 0,
          backgroundColor: Colors.black,
          actions: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text("0"),
            ),
            IconButton(
              icon: Icon(Icons.star),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                String result =
                await showSearch(context: context, delegate: DataSearch());
                if (result != null) BlocProvider
                    .of<VideosBloc>(context)
                    .inSearch
                    .add(result);
              },
            ),
          ],
        ),
        body: StreamBuilder(
            stream: BlocProvider.of<VideosBloc>(context).outVideos,
        builder: (context, snapshot) {
          if (snapshot.hasData)
            return ListView.builder(
                itemBuilder: (context, index){
                  return VideoTile(snapshot.data[index]);
                },
              itemCount: snapshot.data.length,
            );
          else
            return Container();
        }
    ),);
  }
}
