import 'package:flutter/material.dart';

class DemoWidgetState extends StatefulWidget {
  const DemoWidgetState({super.key});

  @override
  State<DemoWidgetState> createState() => _DemoWidgetStateState();
}

class _DemoWidgetStateState extends State<DemoWidgetState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo Widget State'),
        // backgroundColor: Colors.white,
        // scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () {},
              // overlayColor: WidgetStateProperty.resolveWith((states) {
              //   if (states.contains(WidgetState.focused)) {
              //     return Colors.redAccent.withValues(alpha: 0.1);
              //   }
              //   if (states.contains(WidgetState.hovered)) {
              //     return Colors.deepPurple.shade50;
              //   }
              //   if (states.contains(WidgetState.pressed)) {
              //     return Colors.blue;
              //   }
              //   return Colors.white;
              // }),
              overlayColor: WidgetStateColor.fromMap({
                WidgetState.pressed | WidgetState.focused: Colors.red,
                WidgetState.any: Colors.white,
              }),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'InkWell',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Switch(
              activeColor: Colors.red,
              activeTrackColor: Colors.amber,
              inactiveThumbColor: Colors.black,
              inactiveTrackColor: Colors.blueAccent,
              value: false,
              onChanged: (value) {
                debugPrint('$value');
              },
            ),
            ListTile(
              enabled: true,
              title: Text('title'),
              subtitle: Text('subtitle'),
              leading: Icon(Icons.add),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              enabled: false,
              title: Text('title'),
              subtitle: Text('subtitle'),
              leading: Icon(Icons.add),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            DemoWidgetState2(),
          ],
          // children: List.generate(
          //     50,
          //     (index) => Card(
          //           child: Padding(
          //               padding: EdgeInsets.all(16),
          //               child: Text('Index $index')),
          //         )),
        ),
      ),
    );
  }
}

class DemoWidgetState2 extends StatefulWidget {
  const DemoWidgetState2({super.key});

  @override
  State<DemoWidgetState2> createState() => _DemoWidgetState2State();
}

class _DemoWidgetState2State extends State<DemoWidgetState2> {
  final _controller = WidgetStatesController();
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _controller,
        builder: (context, state, _) {
          return Card(
            elevation: (state.contains(WidgetState.pressed) ? 8 : 0).toDouble(),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text('Widget State $state'),
                  TextButton(
                      statesController: _controller,
                      onPressed: () {
                        debugPrint('Button Pressed');
                      },
                      child: Text('Press Me')),
                ],
              ),
            ),
          );
        });
  }
}

class TapAreaThemData {
  final TapAreaStyle style;

  TapAreaThemData({
    required this.style,
  });
}

class TapAreaStyle {
  final WidgetStateProperty<Color?> opacity;
  final WidgetStateProperty<Color?> foregroundHighlight;

  TapAreaStyle({
    required this.opacity,
    required this.foregroundHighlight,
  });
}
