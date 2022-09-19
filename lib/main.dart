import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: CircularCounter(),
    themeMode: ThemeMode.dark,
    debugShowCheckedModeBanner: false,
  ));
}

class CircularCounter extends StatefulWidget {
  const CircularCounter({Key? key}) : super(key: key);

  @override
  State<CircularCounter> createState() => _CircularCounterState();
}

class _CircularCounterState extends State<CircularCounter> {
  final int _duration = 5;
  final CountDownController _countController = CountDownController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "Circular Counter",
            style: TextStyle(
                color: Colors.white54,
                fontSize: 30.0,
                fontWeight: FontWeight.bold),
          ),
          Center(
            child: CircularCountDownTimer(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 2,
                duration: _duration,
                controller: _countController,
                strokeWidth: 20.0,
                isTimerTextShown: true,
                isReverse: true,
                fillColor: Colors.white,
                strokeCap: StrokeCap.round,
                autoStart: false,
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
                ringColor: Colors.blue),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[850],
                  ),
                  onPressed: () {
                    _countController.start();
                  },
                  child: const Text("Start"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[850],
                  ),
                  child: const Text("Pause"),
                  onPressed: () {
                    _countController.pause();
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[850],
                  ),
                  child: const Text("Resume"),
                  onPressed: () {
                    _countController.resume();
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[850],
                  ),
                  child: const Text("Restart"),
                  onPressed: () {
                    _countController.restart(duration: _duration);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
