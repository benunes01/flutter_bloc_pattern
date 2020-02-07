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
        backgroundColor: Colors.black,
        body: StreamBuilder(
            stream: BlocProvider.of<VideosBloc>(context).outVideos,
        //Iniciar vazio para evitar erros
        initialData: [],
        builder: (context, snapshot) {
          if (snapshot.hasData)
            return ListView.builder(
                itemBuilder: (context, index){
                  if(index < snapshot.data.length){
                    return VideoTile(snapshot.data[index]);
                    // index maior que 1, para ele saber que inicio o aplicativo, se não carregaria infinito
                  } else if (index > 1){
                    BlocProvider.of<VideosBloc>(context).inSearch.add(null);
                      return Container(
                        height: 40,
                        width: 40,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.red),),
                      );
                  }

                },
              itemCount: snapshot.data.length + 1,
            );
          else
            return Container();
        }
    ),);
  }
}
