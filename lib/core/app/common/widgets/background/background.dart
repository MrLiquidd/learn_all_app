import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:learn_all/core/core.dart';

class AnimatedGradientBackground extends StatefulWidget {
  final Widget child;

  const AnimatedGradientBackground({super.key, required this.child});

  @override
  _AnimatedGradientBackgroundState createState() =>
      _AnimatedGradientBackgroundState();
}

class _AnimatedGradientBackgroundState extends State<AnimatedGradientBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: -10.0, end: 50.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Layer 1 - Light gradient background
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.primary.withOpacity(0.3),
                AppColors.lightBackground.withOpacity(0.1)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        // Animated shapes
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Stack(
              children: [
                _buildAnimatedShape(
                    -50, -50, _animation.value, AppColors.primary.withOpacity(0.3)),
                _buildAnimatedShape(
                    400, 250, -_animation.value, AppColors.primary.withOpacity(0.3)),
                _buildAnimatedShape(-150, 200, _animation.value,
                    Colors.orange.withOpacity(0.3)),
              ],
            );
          },
        ),
        // Child widget content
        widget.child,
      ],
    );
  }

  Widget _buildAnimatedShape(
      double top, double left, double offset, Color color) {
    return Positioned(
      top: top + offset,
      left: left + offset,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.3),
                blurRadius: 100,
                spreadRadius: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
