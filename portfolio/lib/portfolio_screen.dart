import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'widgets/custom_cursor.dart';
import 'views/desktop_view.dart';
import 'views/mobile_view.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen>
    with SingleTickerProviderStateMixin {
  Offset _mousePos = Offset.zero;
  final List<Offset> _trailingPositions = List.generate(4, (_) => Offset.zero);
  late Ticker _ticker;

  // Smoothing factors for each circle (0.1 to 1.0)
  // 1 is fastest, smaller is slower/more delay
  final List<double> _smoothFactors = [0.25, 0.15, 0.1, 0.08];

  @override
  void initState() {
    super.initState();
    _ticker = createTicker((elapsed) {
      setState(() {
        for (int i = 0; i < _trailingPositions.length; i++) {
          // Lerp each position towards the target or the previous circle
          final target = i == 0 ? _mousePos : _trailingPositions[i - 1];
          _trailingPositions[i] = Offset.lerp(
            _trailingPositions[i],
            target,
            _smoothFactors[i],
          )!;
        }
      });
    });
    _ticker.start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.none,
      onHover: (event) {
        _mousePos = event.localPosition;
      },
      child: Stack(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 1024) {
                return const DesktopView();
              } else {
                return const MobileView();
              }
            },
          ),
          // Cursor Overlay
          IgnorePointer(
            child: CustomPaint(
              painter: CursorPainter(_trailingPositions),
              size: Size.infinite,
            ),
          ),
        ],
      ),
    );
  }
}
