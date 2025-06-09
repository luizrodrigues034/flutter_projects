import 'package:flutter/material.dart';
import 'package:imc_calc/constanst.dart';

class GenderProeperties extends StatelessWidget {
  final IconData icone;
  final String label;
  const GenderProeperties({
    super.key,
    required this.icone,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icone, size: 80),
        SizedBox(height: 15),
        Text(label, style: kLabelTextStyle),
      ],
    );
  }
}
