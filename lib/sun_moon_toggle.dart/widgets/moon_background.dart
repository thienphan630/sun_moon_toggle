import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sun_moon_toggle/constants/color.dart';
import 'package:sun_moon_toggle/constants/svg_path.dart';

class MoonBackground extends StatelessWidget {
  const MoonBackground({
    super.key,
    required this.width,
    required this.height,
    required this.opacity,
    required this.duration,
    required this.position,
  });

  final double width;
  final double height;
  final double opacity;
  final Duration duration;
  final Animation<Offset> position;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: duration,
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: width,
        height: height,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          color: AppColor.nightPrimary,
          borderRadius: BorderRadius.circular(200),
        ),
        child: SlideTransition(
          position: position,
          child: Stack(
            children: [
              Positioned(
                top: 14,
                bottom: 14,
                left: 32,
                child: SvgPicture.asset(
                  SvgPath.stars,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
