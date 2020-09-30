import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class Audios extends StatefulWidget {
  const Audios({
    Key key,
  }) : super(key: key);

  @override
  _AudiosState createState() => _AudiosState();
}

class _AudiosState extends State<Audios> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red.shade100,
        child: ListView.builder(
          itemCount: 15,
          itemBuilder: (BuildContext context, int index) => AudioList(
            index: index,
          ),
        ),
      ),
    );
  }
}

class AudioList extends StatefulWidget {
  AudioList({Key key, this.index}) : super(key: key);
  final index;
  final assetsAudioPlayer = AssetsAudioPlayer();

  @override
  _AudioListState createState() => _AudioListState();
}

class _AudioListState extends State<AudioList> {
  IconData playIcon = Icons.play_circle_filled;
  double _height = 60.0;
  Color _color = Colors.grey.shade200;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: AnimatedContainer(
        height: _height,
        color: _color,
        duration: Duration(seconds: 1),
        curve: Curves.bounceOut,
        child: ListTile(
          title: Text('audio${widget.index + 1}'),
          trailing: Container(
            width: 100.0,
            child: Icon(
              playIcon,
              size: 40.0,
            ),
          ),
          onTap: () {
            setState(() {
              if (widget.assetsAudioPlayer.isPlaying.value) {
                _color = Colors.grey.shade200;
                _height = 60.0;
                playIcon = Icons.play_circle_filled;
                widget.assetsAudioPlayer.pause();
              } else {
                _color = Colors.purple.shade100;
                _height = 200.0;
                playIcon = Icons.pause_circle_filled;
                widget.assetsAudioPlayer.open(
                  Audio("assets/audios/audio.mp3"),
                );
              }
            });
          },
        ),
      ),
    );
  }
}
