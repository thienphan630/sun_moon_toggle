import 'package:flutter/material.dart';
import 'package:sun_moon_toggle/constants/color.dart';
import 'package:sun_moon_toggle/sun_moon_toggle.dart/widgets/moon.dart';
import 'package:sun_moon_toggle/sun_moon_toggle.dart/widgets/moon_background.dart';
import 'package:sun_moon_toggle/sun_moon_toggle.dart/widgets/sun.dart';
import 'package:sun_moon_toggle/sun_moon_toggle.dart/widgets/sun_background.dart';

class SunMoonToggle extends StatefulWidget {
  const SunMoonToggle({
    super.key,
    required this.value,
    required this.onToggle,
    this.width = 300,
    this.height = 100,
    this.duration = const Duration(milliseconds: 1000),
  });

  /// This property is required.
  final bool value;

  /// The duration in milliseconds to change the state of the switch
  ///
  /// Defaults to the value of 1000 milliseconds.
  final Duration duration;

  /// Called when the user toggles the switch.
  ///
  /// This property is required.
  final ValueChanged<bool> onToggle;

  /// The width in double to change the size off switch
  ///
  /// Defaults to the value of 300.
  final double width;

  /// The height in double to change the size off switch
  ///
  /// Defaults to the value of 100.
  final double height;

  @override
  State<SunMoonToggle> createState() => _SunMoonToggleState();
}

class _SunMoonToggleState extends State<SunMoonToggle>
    with SingleTickerProviderStateMixin {
  final double padding = 10;

  late final double iconSwitchSize;

  late final Animation _toggleAnimation;

  late final AnimationController _animationController;

  late final Animation<Offset> _offsetSunAnimation;

  late final Animation<Offset> _offsetMoonAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      value: widget.value ? 1.0 : 0.0,
      duration: widget.duration,
    );
    _toggleAnimation = AlignmentTween(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );
    _offsetSunAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.0, 1.0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    ));
    _offsetMoonAnimation = Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    ));
    iconSwitchSize = widget.height - padding;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(SunMoonToggle oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value == widget.value) return;

    if (widget.value) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) => Align(
        child: GestureDetector(
          onTap: () {
            if (widget.value) {
              _animationController.forward();
            } else {
              _animationController.reverse();
            }
            widget.onToggle(!widget.value);
          },
          child: Container(
            width: widget.width,
            height: widget.height,
            clipBehavior: Clip.antiAlias,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: AppColor.dayPrimary,
              borderRadius: BorderRadius.circular(widget.height / 2),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 4,
                  spreadRadius: 0,
                  color: AppColor.shadowB8FFFFFF,
                ),
                BoxShadow(
                  offset: Offset(0, -3),
                  blurRadius: 4,
                  spreadRadius: 0,
                  color: AppColor.shadow40000000,
                ),
              ],
            ),
            child: SizedBox(
              child: Stack(
                children: [
                  MoonBackground(
                    width: widget.width,
                    height: widget.height,
                    opacity: widget.value ? 1.0 : 0.0,
                    duration: widget.duration,
                    position: _offsetMoonAnimation,
                  ),
                  SunBackground(
                    width: widget.width,
                    height: widget.height,
                    opacity: !widget.value ? 1.0 : 0.0,
                    duration: widget.duration,
                    toggleAnimation: _toggleAnimation,
                    position: _offsetSunAnimation,
                  ),
                  Moon(
                    iconSwitchSize: iconSwitchSize,
                    opacity: !widget.value ? 0.0 : 1.0,
                    duration: widget.duration,
                    toggleAnimation: _toggleAnimation,
                  ),
                  Sun(
                    iconSwitchSize: iconSwitchSize,
                    opacity: widget.value ? 0.0 : 1.0,
                    duration: widget.duration,
                    toggleAnimation: _toggleAnimation,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
