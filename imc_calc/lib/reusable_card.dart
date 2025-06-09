import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    super.key,
    required this.selectColor,
    this.chieldContent,
    this.setGender,
  });

  final Color selectColor;
  final VoidCallback? setGender;
  final Widget? chieldContent;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: setGender,
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: selectColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: chieldContent,
      ),
    );
  }
}
