import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thirty_days_beginer_ui_basics/demo_riverpod/joke.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Joke Generator'),
      ),
      body: SizedBox.expand(
        child: Consumer(
          builder: (context, ref, child) {
            final randomJoke = ref.watch(jokeProvider);
            return Stack(
              alignment: Alignment.center,
              children: [
                if (randomJoke.isRefreshing)
                  const Positioned(child: LinearProgressIndicator()),
                switch (randomJoke) {
                  AsyncValue<Joke>(:final value?) => SelectableText(
                      '${value.setup}\n\n${value.punchline}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  AsyncValue<Joke>(error: != null) =>
                    Text('Error fetching joke'),
                  AsyncValue<Joke>() => CircularProgressIndicator(),
                },
                Positioned(
                  bottom: 20,
                  child: ElevatedButton(
                    onPressed: () => ref.invalidate(jokeProvider),
                    child: Text('Get Another Joke'),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
