import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../constants/colors.dart';

class AnimatedPlexusBackground extends StatefulWidget {
  const AnimatedPlexusBackground({super.key});

  @override
  State<AnimatedPlexusBackground> createState() =>
      _AnimatedPlexusBackgroundState();
}

class _AnimatedPlexusBackgroundState extends State<AnimatedPlexusBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<PlexusNode> nodes = [];
  Offset? mousePosition;
  static const int nodeCount = 60;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..addListener(() {
            setState(() {
              for (var node in nodes) {
                node.update();
              }
            });
          })
          ..repeat();

    // Initialize nodes with random positions and velocities
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;
      for (int i = 0; i < nodeCount; i++) {
        nodes.add(PlexusNode(size));
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          mousePosition = event.localPosition;
        });
      },
      onExit: (_) {
        setState(() {
          mousePosition = null;
        });
      },
      child: CustomPaint(
        painter: PlexusPainter(nodes, mousePosition),
        size: Size.infinite,
      ),
    );
  }
}

class PlexusNode {
  late Offset position;
  late Offset velocity;
  final Size screenSize;
  static final math.Random _random = math.Random();
  static const double speed = 0.5;

  PlexusNode(this.screenSize) {
    position = Offset(
      _random.nextDouble() * screenSize.width,
      _random.nextDouble() * screenSize.height,
    );
    velocity = Offset(
      (_random.nextDouble() - 0.5) * speed,
      (_random.nextDouble() - 0.5) * speed,
    );
  }

  void update() {
    position += velocity;

    // Bounce off edges with a bit of padding
    if (position.dx < -50 || position.dx > screenSize.width + 50) {
      velocity = Offset(-velocity.dx, velocity.dy);
    }
    if (position.dy < -50 || position.dy > screenSize.height + 50) {
      velocity = Offset(velocity.dx, -velocity.dy);
    }
  }
}

class PlexusPainter extends CustomPainter {
  final List<PlexusNode> nodes;
  final Offset? mousePosition;

  PlexusPainter(this.nodes, this.mousePosition);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primaryCyan.withOpacity(0.2)
      ..strokeWidth = 1.0;

    final dotPaint = Paint()
      ..color = AppColors.primaryCyan.withOpacity(0.4)
      ..style = PaintingStyle.fill;

    const double maxDistance = 150.0;
    const double mouseInteractionDistance = 200.0;

    for (int i = 0; i < nodes.length; i++) {
      final node = nodes[i];
      Offset drawPos = node.position;

      // Mouse interaction
      if (mousePosition != null) {
        final dist = (node.position - mousePosition!).distance;
        if (dist < mouseInteractionDistance) {
          final direction = (node.position - mousePosition!) / dist;
          final strength = 1.0 - (dist / mouseInteractionDistance);
          // Gently push/pull nodes
          drawPos += direction * strength * 30.0;
        }
      }

      // Draw node if it's within bounds
      canvas.drawCircle(drawPos, 1.5, dotPaint);

      // Draw lines
      for (int j = i + 1; j < nodes.length; j++) {
        final other = nodes[j];
        final distance = (node.position - other.position).distance;

        if (distance < maxDistance) {
          final opacity = (1.0 - (distance / maxDistance)) * 0.2;
          paint.color = AppColors.primaryCyan.withOpacity(opacity);
          canvas.drawLine(drawPos, other.position, paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant PlexusPainter oldDelegate) => true;
}
