import 'package:bloc_eg/src/newappforbloc/blocs/app_stt_provider.dart';
import 'package:bloc_eg/src/ui/movie_list_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ApplicationStateProvider(
      child: MaterialApp(
        showPerformanceOverlay: false,
        theme: ThemeData.dark(),
        home: Scaffold(
          body: MovieList(),
        ),
      ),
    );
  }
}
