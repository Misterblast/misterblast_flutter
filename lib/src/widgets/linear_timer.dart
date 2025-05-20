import 'package:flutter/material.dart';
import 'package:misterblast_flutter/src/themes/theme.dart';

class LinearTimer extends StatefulWidget {
  const LinearTimer({
    super.key,
    required this.duration,
    required this.onTimerComplete,
  });

  final int duration;
  final Function() onTimerComplete;

  @override
  State<LinearTimer> createState() => LinearTimerState();
}

class LinearTimerState extends State<LinearTimer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.duration),
    )..addListener(() {
        setState(() {});
        if (_controller.isCompleted) {
          widget.onTimerComplete();
        }
      });

    _controller.forward();
  }

  void restart() {
    _controller.reset();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _getProgressColor(double remainingTime) {
    if (remainingTime <= 60) {
      return Colors.red;
    } else if (remainingTime <= 150) {
      return AppColors.warmOrange;
    }
    return AppColors.coolTeal;
  }

  @override
  Widget build(BuildContext context) {
    final double progress = _controller.value;
    final double remainingTime = widget.duration * (1 - progress);
    return LinearProgressIndicator(
      minHeight: 10,
      value: remainingTime / widget.duration,
      backgroundColor: Colors.grey.shade300,
      valueColor: AlwaysStoppedAnimation<Color>(
        _getProgressColor(remainingTime),
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
