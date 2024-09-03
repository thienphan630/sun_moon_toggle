import 'package:flutter/material.dart';
import 'package:sun_moon_toggle/constants/color.dart';

class ShadowCircle extends StatelessWidget {
  const ShadowCircle({super.key, required this.size, required this.ratio});

  final double size;

  final double ratio;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      width: size,
      height: size,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColor.shadowCircle,
            width: size * ratio,
            style: BorderStyle.solid,
            strokeAlign: BorderSide.strokeAlignOutside,
          )),
    );
  }
}
