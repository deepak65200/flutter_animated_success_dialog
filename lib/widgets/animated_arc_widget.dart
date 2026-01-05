import 'package:flutter/material.dart';
import 'package:flutter_success_dialog_demo/widgets/success_dialog.dart';

import 'dual_arc_painter.dart';

class AnimatedArcWidget extends StatefulWidget {
  const AnimatedArcWidget({super.key});

  @override
  AnimatedArcWidgetState createState() => AnimatedArcWidgetState();
}

class AnimatedArcWidgetState extends State<AnimatedArcWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _yellowArcAnimation;
  late Animation<double> _blueArcAnimation;
  late Animation<double> _checkmarkScaleAnimation;
  late Animation<double> _glowOpacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _yellowArcAnimation = Tween<double>(begin: 0, end: 270).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );

    _blueArcAnimation = Tween<double>(begin: 0, end: 270).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.3, 0.9, curve: Curves.easeOut),
      ),
    );

    _checkmarkScaleAnimation = Tween<double>(begin: 0, end: 1.2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.7, 1.0, curve: Curves.elasticOut),
      ),
    );

    _glowOpacityAnimation = Tween<double>(begin: 0.0, end: 0.6).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.6, 0.8, curve: Curves.easeOut),
      ),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 120,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                size: Size(120, 120),
                painter: DualArcPainter(
                  _yellowArcAnimation.value,
                  _blueArcAnimation.value,
                ),
              ),
              Opacity(
                opacity: _glowOpacityAnimation.value,
                child: Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        Colors.blue.withValues(alpha: 0.3),
                        Colors.transparent,
                      ],
                      radius: 0.6,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withValues(alpha: 0.4),
                        blurRadius: 25,
                        spreadRadius: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Transform.scale(
                scale: _checkmarkScaleAnimation.value,
                child: Icon(Icons.check_circle, size: 45, color: Colors.blue),
              ),
            ],
          );
        },
      ),
    );
  }
}




