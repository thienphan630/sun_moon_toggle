import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:sun_moon_toggle/constants/color.dart';
import 'package:sun_moon_toggle/sun_moon_toggle.dart/widgets/shadow_circle.dart';


class Sun extends StatelessWidget {
  const Sun({
    super.key,
    required this.iconSwitchSize,
    required this.opacity,
    required this.duration,
    required Animation toggleAnimation,
  }) : _toggleAnimation = toggleAnimation;

  final double iconSwitchSize;
  final double opacity;
  final Duration duration;
  final Animation _toggleAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: duration,
      child: Align(
        alignment: _toggleAnimation.value,
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              margin: const EdgeInsets.all(6),
              width: iconSwitchSize,
              height: iconSwitchSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColor.shadowCircle,
                  width: iconSwitchSize,
                  style: BorderStyle.solid,
                  strokeAlign: BorderSide.strokeAlignOutside,
                ),
              ),
            ),
            ShadowCircle(size: iconSwitchSize, ratio: 1),
            ShadowCircle(size: iconSwitchSize, ratio: 2 / 3),
            ShadowCircle(size: iconSwitchSize, ratio: 1 / 3),
            InnerShadow(
              shadows: const [
                BoxShadow(
                  offset: Offset(3, 4),
                  blurRadius: 4,
                  spreadRadius: 0,
                  color: AppColor.shadow99FEF7E7,
                  blurStyle: BlurStyle.inner,
                ),
                BoxShadow(
                  offset: Offset(0, -4),
                  blurRadius: 4,
                  spreadRadius: 0,
                  color: AppColor.shadow2E544204,
                  blurStyle: BlurStyle.inner,
                ),
              ],
              child: Container(
                margin: const EdgeInsets.all(6),
                width: iconSwitchSize,
                height: iconSwitchSize,
                decoration: const BoxDecoration(
                    color: AppColor.sun,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.shadow40000000,
                        offset: Offset(3, 2),
                        spreadRadius: 0,
                        blurRadius: 4,
                      ),
                      BoxShadow(
                        color: AppColor.shadow40000000,
                        offset: Offset(3, 3),
                        spreadRadius: 0,
                        blurRadius: 3,
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
