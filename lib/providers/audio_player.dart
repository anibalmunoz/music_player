import 'package:flutter/material.dart';

class AudioPlayer with ChangeNotifier {
  bool _playing = false;
  late AnimationController controller;
  Duration _songDuration = const Duration(milliseconds: 1000);
  Duration _current = const Duration(milliseconds: 0);

  String get songTotalDuration => printDuration(_songDuration);
  String get currentSecond => printDuration(_current);
  double get porcentaje => (_songDuration.inSeconds > 1) ? _current.inSeconds / _songDuration.inSeconds : 0;

  bool get playing => _playing;
  set playing(bool val) {
    _playing = val;
    notifyListeners();
  }

  Duration get songDuration => _songDuration;
  set songDuration(Duration val) {
    _songDuration = val;
    notifyListeners();
  }

  Duration get current => _current;
  set current(Duration val) {
    _current = val;
    notifyListeners();
  }

  String printDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    // return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}
