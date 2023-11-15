import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple[300],
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text('Ringtone Player'),
        ),
        body: MusicPlayer(),
      ),
    );
  }
}

class MusicPlayer extends StatefulWidget {
  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  final AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  void playMusic(String assetPath) {
    assetsAudioPlayer.open(
      Audio(assetPath),
      showNotification: true,
      loopMode: LoopMode.none,
      volume: 1.0,
      respectSilentMode: true,
    );
  }

  @override
  void dispose() {
    assetsAudioPlayer.dispose();
    super.dispose();
  }

  Widget myButton({
    required int musicNumber,
    required Color buttonColor,
    required String buttonText,
    required String assetPath,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 1.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
          ),
          onPressed: () {
            playMusic(assetPath);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                Icon(
                  Icons.music_note,
                  color: buttonColor,
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  buttonText,
                  style: TextStyle(
                    color: buttonColor,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[300],
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Ringtones'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          myButton(
            musicNumber: 1,
            buttonColor: Colors.red,
            buttonText: 'Samsung Galaxy',
            assetPath: 'assets/1.mp3',
          ),
          myButton(
            musicNumber: 2,
            buttonColor: Colors.green,
            buttonText: 'Samsung Note',
            assetPath: 'assets/2.mp3',
          ),
          myButton(
            musicNumber: 3,
            buttonColor: Colors.black,
            buttonText: 'Nokia',
            assetPath: 'assets/3.mp3',
          ),
          myButton(
            musicNumber: 4,
            buttonColor: Colors.orange,
            buttonText: 'iPhone 11',
            assetPath: 'assets/4.mp3',
          ),
          myButton(
            musicNumber: 5,
            buttonColor: Colors.blue,
            buttonText: 'Whatsapp',
            assetPath: 'assets/5.mp3',
          ),
          myButton(
            musicNumber: 6,
            buttonColor: Colors.purple,
            buttonText: 'Samsung S7',
            assetPath: 'assets/6.mp3',
          ),
          myButton(
            musicNumber: 7,
            buttonColor: Colors.black,
            buttonText: 'iPhone 6',
            assetPath: 'assets/7.mp3',
          ),
        ],
      ),
    );
  }
}
