import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

//Un widget pour calculer la bar de progression des taches d'un maintenancier
class RoundProgressBar extends StatefulWidget {
  final double progress;
  const RoundProgressBar({super.key, required this.progress});

  @override
  State<RoundProgressBar> createState() => _RoundProgressBarState();
}

class _RoundProgressBarState extends State<RoundProgressBar> {
  @override
  Widget build(BuildContext context) {
    Color progressColor = Colors.amber;

    if (widget.progress >= 0.8) {
      progressColor = Colors.green;
    } else if (widget.progress >= 0.5) {
      progressColor = Colors.yellow;
    } else {
      progressColor = Colors.red;
    }
    return Container(
        padding: const EdgeInsets.only(
          top: 0,
          bottom: 2,
        ),
        child: CircularPercentIndicator(
          radius: 34,
          lineWidth: 6,
          backgroundColor: Colors.grey,
          progressColor: progressColor,
          percent: widget.progress,
          center: Text(
            "${(widget.progress * 100.0).toStringAsFixed(1)}%",
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
          animation: true,
          animationDuration: 2000,
          footer: const Text("Task progress %"),
        ));
  }
}
