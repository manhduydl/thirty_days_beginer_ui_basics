import 'dart:math';

import 'package:flutter/material.dart';

class DemoSliver extends StatefulWidget {
  const DemoSliver({super.key});

  @override
  State<DemoSliver> createState() => _DemoSliverState();
}

class _DemoSliverState extends State<DemoSliver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Demo Sliver'),
      // ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(
                  minHeight: 50,
                  maxHeight: 200,
                  child: Text(
                    'Sliver App Bar',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  )),
              pinned: true,
            ),

            // SliverAppBar(
            //   title: Text('Sliver App Bar'),
            //   expandedHeight: 200,
            //   backgroundColor: Colors.blue,
            //   flexibleSpace: FlexibleSpaceBar(
            //     background: Image.network(
            //       'https://picsum.photos/seed/picsum/800/400',
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            //   floating: true,
            //   pinned: false,
            // ),

            // SliverList(
            //     delegate: SliverChildListDelegate([
            //   Container(
            //     height: 150,
            //     color: Colors.red,
            //   ),
            // ])),
            // SliverList(delegate: SliverChildBuilderDelegate((context, index) {
            //   return Container(height: 150, color: getRandomColor());
            // }))

            // SliverGrid.count(
            //     crossAxisCount: 3,
            //     children: List.generate(50, (index) {
            //       return Container(
            //         height: 150,
            //         color: getRandomColor(),
            //       );
            //     }))

            // SliverGrid.extent(
            //     maxCrossAxisExtent: 200,
            //     children: List.generate(50, (index) {
            //       return Container(
            //         height: 150,
            //         color: getRandomColor(),
            //       );
            //     }))

            SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Container(
                    height: 150,
                    color: getRandomColor(),
                  );
                }))
          ],
        ),
      ),
    );
  }

  // List<Widget> _buildColorBlocks(List<Color> colors) =>
  //     colors.map((c) => Container(height: 150, color: c)).toList();

  // Color _getRandomColor() {
  //   final random = (DateTime.now().millisecondsSinceEpoch % 0xFFFFFF)
  //       .toRadixString(16)
  //       .padLeft(6, '0');
  //   return Color(int.parse('0xFF$random'));
  // }

  Color getRandomColor() {
    final random = Random();
    random.nextInt(255); // To ensure we have a random seed
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final double progress = shrinkOffset / maxExtent;
    debugPrint('Progress: $progress');
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedOpacity(
            opacity: progress,
            duration: Duration(milliseconds: 300),
            child: ColoredBox(
              color: const Color(0xBE7A81FF),
            ),
          ),
          AnimatedOpacity(
            opacity: 1 - progress,
            duration: Duration(milliseconds: 300),
            child: Image.network(
              'https://picsum.photos/seed/picsum/800/400',
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return minHeight != oldDelegate.minHeight ||
        maxHeight != oldDelegate.maxHeight ||
        child != oldDelegate.child;
  }
}
