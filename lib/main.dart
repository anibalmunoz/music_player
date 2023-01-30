import 'package:flutter/material.dart';
import 'package:music_player/pages/music_player_page/music_player_page.dart';
import 'package:music_player/providers/audio_player.dart';
import 'package:music_player/themes/my_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(
    MultiProvider(providers: [ChangeNotifierProvider(create: (context) => AudioPlayer())], child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Player',
      theme: myTheme,
      home: const MusicPlayerPage(),
    );
  }
}
