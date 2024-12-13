import 'package:flutter/material.dart';
import 'package:portfolio_jessica/theme/app_theme.dart';

class AnimatedProgressBar extends StatefulWidget {
  final double percentage;
  final Color? backgroundColor;
  final Color? valueColor;
  final Duration duration;

  const AnimatedProgressBar({
    super.key,
    required this.percentage,
    this.backgroundColor,
    this.valueColor,
    this.duration = const Duration(milliseconds: 1500),
  });

  @override
  State<AnimatedProgressBar> createState() => _AnimatedProgressBarState();
}

class _AnimatedProgressBarState extends State<AnimatedProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0,
      end: widget.percentage / 100,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
  }

  @override
  void didUpdateWidget(AnimatedProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.percentage != widget.percentage) {
      _animation = Tween<double>(
        begin: _animation.value,
        end: widget.percentage / 100,
      ).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ));

      _controller
        ..reset()
        ..forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return LinearProgressIndicator(
          value: _animation.value,
          backgroundColor:
              widget.backgroundColor ?? Colors.grey.withOpacity(0.1),
          valueColor: AlwaysStoppedAnimation<Color>(
            widget.valueColor ?? AppColors.pastelPink,
          ),
          minHeight: 8,
          borderRadius: BorderRadius.circular(4),
        );
      },
    );
  }
}