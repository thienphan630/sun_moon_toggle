import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sun_moon_toggle/constants/color.dart';
import 'package:sun_moon_toggle/constants/svg_path.dart';

class SunBackground extends StatelessWidget {
  const SunBackground({
    super.key,
    required this.width,
    required this.height,
    required this.opacity,
    required this.duration,
    required Animation toggleAnimation,
    required this.position,
  }) : _toggleAnimation = toggleAnimation;

  final double width;
  final double height;
  final double opacity;
  final Duration duration;
  final Animation _toggleAnimation;
  final Animation<Offset> position;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: AnimatedOpacity(
        opacity: opacity,
        duration: duration,
        child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          width: 300,
          height: 100,
          alignment: _toggleAnimation.value,
          decoration: BoxDecoration(
              color: AppColor.dayPrimary,
              borderRadius: BorderRadius.circular(200),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(1, 5),
                  blurRadius: 12,
                  spreadRadius: 0,
                  color: Color(0x40000000),
                  blurStyle: BlurStyle.inner,
                ),
                BoxShadow(
                  offset: Offset(0, -1),
                  blurRadius: 9,
                  spreadRadius: 0,
                  color: Color(0x40000000),
                  blurStyle: BlurStyle.inner,
                ),
              ]),
          child: SlideTransition(
            position: position,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  right: -10,
                  bottom: -50,
                  child: SvgPicture.asset(
                    SvgPath.cloudBack,
                    clipBehavior: Clip.none,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  right: -30,
                  bottom: -60,
                  child: SvgPicture.asset(
                    SvgPath.cloudFront,
                    clipBehavior: Clip.none,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
