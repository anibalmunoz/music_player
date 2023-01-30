import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:music_player/providers/audio_player.dart';
import 'package:provider/provider.dart';

class ImagenDiscoDuracion extends StatelessWidget {
  const ImagenDiscoDuracion({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      margin: const EdgeInsets.only(top: 45),
      child: Row(
        children: const [
          _ImagenDisco(),
          SizedBox(width: 20),
          _BarraProgreso(),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}

class _ImagenDisco extends StatelessWidget {
  const _ImagenDisco();

  @override
  Widget build(BuildContext context) {
    final audioProv = Provider.of<AudioPlayer>(context, listen: true);

    return Container(
      padding: const EdgeInsets.all(20),
      width: 250,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        gradient: const LinearGradient(begin: Alignment.topLeft, colors: [Color(0xff484750), Color(0xff1e1c24)]),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Stack(alignment: Alignment.center, children: [
          SpinPerfect(
            delay: const Duration(milliseconds: 500),
            manualTrigger: true,
            controller: (c) => audioProv.controller = c,
            duration: const Duration(seconds: 10),
            infinite: true,
            child: const Image(image: AssetImage("assets/aurora.jpg")),
          ),
          Container(
              width: 25, height: 25, decoration: const BoxDecoration(color: Colors.black38, shape: BoxShape.circle)),
          Container(
            width: 18,
            height: 18,
            decoration: const BoxDecoration(color: Color(0xff1c1c25), shape: BoxShape.circle),
          ),
        ]),
      ),
    );
  }
}

class _BarraProgreso extends StatelessWidget {
  const _BarraProgreso();

  @override
  Widget build(BuildContext context) {
    final estilo = TextStyle(color: Colors.white.withOpacity(0.4));
    final audioProv = Provider.of<AudioPlayer>(context);
    final porcentaje = audioProv.porcentaje;

    return Column(
      children: [
        Text(audioProv.songTotalDuration, style: estilo),
        const SizedBox(height: 10),
        Stack(alignment: AlignmentDirectional.bottomStart, children: [
          Container(width: 3, height: 230, color: Colors.white.withOpacity(0.1)),
          Container(width: 3, height: 230 * porcentaje, color: Colors.white.withOpacity(0.8)),
        ]),
        const SizedBox(height: 10),
        Text(audioProv.currentSecond, style: estilo),
      ],
    );
  }
}
