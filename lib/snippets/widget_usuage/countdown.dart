import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class CountdownWidget extends StatefulWidget {
  final Widget Function(double) child;
  final Widget Function(CountdownController controller) endChild;
  final int seconds;
  final Function? onFinished;
  final CountdownController? countdownController;

  const CountdownWidget({
    required this.child,
    required this.endChild,
    required this.seconds,
    this.countdownController,
    this.onFinished,
    Key? key,
  }) : super(key: key);

  @override
  State<CountdownWidget> createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  final CountdownController _countdownController =
      CountdownController(autoStart: true);

  @override
  Widget build(BuildContext context) {
    return Countdown(
      seconds: widget.seconds,
      controller: widget.countdownController ?? _countdownController,
      build: (BuildContext context, double time) => time < 1
          ? widget.endChild(widget.countdownController ?? _countdownController)
          : widget.child(time),
      interval: const Duration(seconds: 1),
      onFinished: widget.onFinished,
    );
  }
}
