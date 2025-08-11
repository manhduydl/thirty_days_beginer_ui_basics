import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DemoTapArea extends StatelessWidget {
  const DemoTapArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tap Area Demo')),
      body: Center(
        child: TapArea(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Tapped!')),
            );
          },
          onLongTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Long Pressed!')),
            );
          },
          child: ListTile(
              tileColor: Colors.blue.shade50,
              leading: const Icon(Icons.touch_app),
              title: const Text('Tap or Long Press Me'),
              subtitle: const Text('This is a custom tap area widget.'),
              trailing: Text(
                  '${DateTime.now().day.toString().padLeft(2, '0')}.${DateTime.now().month}.${DateTime.now().year}',
                  style: TextStyle(color: Colors.grey.shade600))),
        ),
      ),
    );
  }
}

class TapArea extends StatefulWidget {
  final Widget child;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onLongTap;
  final double? borderRadius;
  final EdgeInsets? padding;

  const TapArea({
    super.key,
    required this.child,
    required this.onTap,
    this.onLongTap,
    this.borderRadius,
    this.padding,
  });

  @override
  // ignore: no_logic_in_create_state
  State<TapArea> createState() => defaultTargetPlatform == TargetPlatform.iOS
      ? _TapAreaIosState()
      : _TapAreaAndroidState();
}

class _TapAreaIosState extends State<TapArea> {
  bool _isDown = false;
  @override
  Widget build(BuildContext context) {
    final content = Padding(
      padding: widget.padding ?? EdgeInsets.all(8.0),
      child: widget.child,
    );
    if (widget.onTap == null && widget.onLongTap == null) {
      return content;
    }
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isDown = true;
        });
      },
      onTapCancel: () {
        setState(() {
          _isDown = false;
        });
      },
      onTap: () {
        setState(() {
          _isDown = false;
        });
        widget.onTap?.call();
      },
      onLongPress: widget.onLongTap,
      child: Focus(
        child: Opacity(
          opacity: _isDown ? 0.5 : 1.0,
          child: content,
        ),
      ),
    );
  }
}

class _TapAreaAndroidState extends State<TapArea> {
  @override
  Widget build(BuildContext context) {
    final content = Padding(
      padding: widget.padding ?? EdgeInsets.all(8.0),
      child: widget.child,
    );
    if (widget.onTap == null && widget.onLongTap == null) {
      return content;
    }
    return Material(
      color: Colors.transparent,
      clipBehavior: Clip.none,
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.0),
      child: InkWell(
        onTap: widget.onTap,
        onLongPress: widget.onLongTap,
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.0),
        child: content,
      ),
    );
  }
}
