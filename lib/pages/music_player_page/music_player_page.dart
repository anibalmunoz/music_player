import 'package:flutter/material.dart';
import 'package:music_player/helpers/helpers.dart';
import 'package:music_player/pages/music_player_page/imagen_disco_duracion.dart';
import 'package:music_player/pages/music_player_page/titulo_play.dart';
import 'package:music_player/widgets/custom_appbar.dart';

class MusicPlayerPage extends StatelessWidget {
  const MusicPlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Background(),
          Column(children: const [
            CustomAppbar(),
            ImagenDiscoDuracion(),
            TituloPlay(),
            Expanded(child: Lyrics()),
          ]),
        ],
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: screenSize.height * 0.8,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff33333e), Color(0xff201e28)],
          begin: Alignment.centerLeft,
          end: Alignment.center,
        ),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60)),
      ),
    );
  }
}

class Lyrics extends StatelessWidget {
  const Lyrics({super.key});

  @override
  Widget build(BuildContext context) {
    final lyrics = getLyrics();

    Widget textLyric(e) => Text(e, style: TextStyle(fontSize: 20, color: Colors.white.withOpacity(0.6)));

    return ListWheelScrollView(
      itemExtent: 42,
      diameterRatio: 1.5,
      physics: const BouncingScrollPhysics(),
      children: lyrics.map((e) => textLyric(e)).toList(),
    );
  }
}
