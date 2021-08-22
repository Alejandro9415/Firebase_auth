import 'package:flutter/material.dart';
import 'package:flutter_auth/app/ui/pages/home/home_page.dart';
import 'package:flutter_meedu/screen_utils.dart';

class HomeTabBar extends StatelessWidget {
  HomeTabBar({Key? key}) : super(key: key);

  final _homeController = homeProvider.read;

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;

    return SafeArea(
      top: false,
      child: TabBar(
        labelColor: isDark ? Colors.pinkAccent : Colors.blue,
        unselectedLabelColor: isDark ? Colors.white30 : Colors.black26,
        controller: _homeController.tabController,
        indicator: _CustomIndicator(
          isDark ? Colors.pinkAccent : Colors.blue,
        ),
        tabs: const [
          Tab(
            icon: Icon(
              Icons.home_outlined,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.person_outlined,
            ),
          )
        ],
      ),
    );
  }
}

class _CustomIndicator extends Decoration {
  final Color _color;

  const _CustomIndicator(this._color);
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) =>
      _CirclePainter(_color);
}

class _CirclePainter extends BoxPainter {
  _CirclePainter(this._color);

  final Color _color;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final paint = Paint()..color = _color;

    final size = configuration.size!;
    final center = Offset(offset.dx + size.width * 0.5, size.height * 0.8);
    canvas.drawCircle(
      center,
      3,
      paint,
    );
  }
}
