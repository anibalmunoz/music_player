import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/providers/audio_player.dart';
import 'package:provider/provider.dart';

class TituloPlay extends StatefulWidget {
  const TituloPlay({super.key});

  @override
  State<TituloPlay> createState() => _TituloPlayState();
}

class _TituloPlayState extends State<TituloPlay> with SingleTickerProviderStateMixin {
  bool isPlaying = false;
  bool fistTime = true;
  late AnimationController controller;
  final assetAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void open() {
    final audioProv = Provider.of<AudioPlayer>(context, listen: false);

    assetAudioPlayer.open(Audio('assets/Breaking-Benjamin-Far-Away.mp3'), autoStart: true, showNotification: true);
    assetAudioPlayer.currentPosition.listen((duration) => audioProv.current = duration);
    assetAudioPlayer.current.listen((playingAudio) {
      audioProv.songDuration = playingAudio?.audio.duration ?? const Duration(seconds: 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      margin: const EdgeInsets.only(top: 40),
      child: Row(
        children: [
          Column(
            children: [
              Text("Far Away", style: TextStyle(fontSize: 30, color: Colors.white.withOpacity(0.8))),
              Text("-Breaking Benjamin-", style: TextStyle(fontSize: 15, color: Colors.white.withOpacity(0.8))),
            ],
          ),
          const Spacer(),
          FloatingActionButton(
            elevation: 0,
            highlightElevation: 0,
            backgroundColor: const Color(0xfff8cb51),
            onPressed: () => _playMusicAndAnimations(),
            child: AnimatedIcon(icon: AnimatedIcons.play_pause, progress: controller),
          )
        ],
      ),
    );
  }

  void _playMusicAndAnimations() {
    final audioProv = Provider.of<AudioPlayer>(context, listen: false);

    if (isPlaying) {
      controller.reverse();
      isPlaying = false;
      audioProv.controller.stop();
    } else {
      controller.forward();
      isPlaying = true;
      audioProv.controller.repeat();
    }
    if (fistTime) {
      open();
      fistTime = false;
    } else {
      assetAudioPlayer.playOrPause();
    }
  }
}
