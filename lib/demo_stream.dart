import 'dart:async';

import 'package:flutter/material.dart';

class MyStream {
  int _counter = 0;
  final StreamController<int> _controller = StreamController<int>.broadcast();
  Stream<String> get counterStream =>
      _controller.stream.transform(counterTransform);

  final counterTransform = StreamTransformer<int, String>.fromHandlers(
    handleData: (data, sink) {
      data += 10;
      sink.add('$data');
    },
  );

  void increment() {
    _counter++;
    _controller.sink.add(_counter);
  }

  void dispose() {
    _controller.close();
  }
}

class DemoStream extends StatefulWidget {
  const DemoStream({super.key});

  @override
  State<DemoStream> createState() => _DemoStreamState();
}

class _DemoStreamState extends State<DemoStream> {
  final MyStream myStream = MyStream();
  @override
  Widget build(BuildContext context) {
    myStream.counterStream.listen(
      (event) {
        // debugPrint('Counter value: $event');
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo Stream'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You have pressed the button this many times:'),
            StreamBuilder(
              stream: myStream.counterStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data ?? 'Null',
                      style: Theme.of(context).textTheme.headlineMedium);
                }
                return Text(
                  '0',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => myStream.increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
