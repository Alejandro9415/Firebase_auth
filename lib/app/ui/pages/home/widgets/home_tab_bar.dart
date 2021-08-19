import 'package:flutter/material.dart';
import 'package:flutter_auth/app/ui/pages/home/home_page.dart';
import '../../../utils/dark_mode_extension.dart';

class HomeTabBar extends StatelessWidget {
  HomeTabBar({Key? key}) : super(key: key);

  final _homeController = homeProvider.read;

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;

    return SafeArea(
      top: false,
      child: TabBar(
        labelColor: Colors.blue,
        unselectedLabelColor: isDark ? Colors.white30 : Colors.black26,
        controller: _homeController.tabController,
        indicator: _CustomIndicator(),
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
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _CirclePainter();
}

class _CirclePainter extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final paint = Paint()..color = Colors.blue;

    final size = configuration.size!;
    final center = Offset(offset.dx + size.width * 0.5, size.height * 0.8);
    canvas.drawCircle(
      center,
      3,
      paint,
    );
  }
}
