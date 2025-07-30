import 'package:flutter/material.dart';

class DemoListView1 extends StatelessWidget {
  DemoListView1({super.key});

  final List<ListItem> items = List.generate(1000, (index) {
    return index % 6 == 0
        ? HeaderItem('Heading $index')
        : MessageItem('Sender $index', 'body $index');
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo ListView'),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return ListTile(
          title: items[index].buildTitle(context),
          subtitle: items[index].buildSubtitle(context),
        );
      }),
    );
  }
}

abstract class ListItem {
  Widget buildTitle(BuildContext context);
  Widget buildSubtitle(BuildContext context);
}

class HeaderItem implements ListItem {
  final String title;

  HeaderItem(this.title);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }

  @override
  Widget buildSubtitle(BuildContext context) {
    return const SizedBox.shrink();
  }
}

class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(sender);
  }

  @override
  Widget buildSubtitle(BuildContext context) {
    return Text(body);
  }
}
