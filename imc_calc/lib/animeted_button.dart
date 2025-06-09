import 'dart:async';

import 'package:flutter/material.dart';
import 'package:imc_calc/constanst.dart';

class AnimetedButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData icon;
  final VoidCallback? onTapPush;
  final VoidCallback? stopIncrement;
  const AnimetedButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.icon,
    this.onTapPush,
    this.stopIncrement,
  });

  @override
  State<AnimetedButton> createState() => _AnimetedButtonState();
}

class _AnimetedButtonState extends State<AnimetedButton> {
  double _scale = 1.0;
  Timer? _holdTimer;
  bool _holding = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() => _scale = 0.80);

        _holding = false;

        _holdTimer = Timer(Duration(milliseconds: 300), () {
          _holding = true;
          widget.onTapPush?.call();
        });
      },
      onTapUp: (_) {
        setState(() => _scale = 1.0);

        _holdTimer?.cancel();

        if (!_holding) {
          widget.onPressed();
        }

        widget.stopIncrement?.call();
      },
      onTapCancel: () {
        setState(() => _scale = 1.0);

        _holdTimer?.cancel();
        widget.stopIncrement?.call();
      },
      child: AnimatedScale(
        scale: _scale,
        duration: Duration(milliseconds: 100),
        curve: Curves.easeOut,
        child: OutlinedButton(
          onPressed: null,
          style: OutlinedButton.styleFrom(
            backgroundColor: kBottomContainerColour,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: CircleBorder(),
          ),
          child: Icon(widget.icon, color: Colors.white, size: 40, weight: 1000),
        ),
      ),
    );
  }
}
