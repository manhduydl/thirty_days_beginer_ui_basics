import 'package:flutter/material.dart';

class ListWithSpacedItem extends StatefulWidget {
  const ListWithSpacedItem({super.key});

  @override
  State<ListWithSpacedItem> createState() => _ListWithSpacedItemState();
}

class _ListWithSpacedItemState extends State<ListWithSpacedItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('List with Spaced Item'),
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // children: [
                //   ListTile(
                //     tileColor: Colors.red,
                //     title: Text('Item 1'),
                //   ),
                //   Spacer(),
                //   ListTile(
                //     tileColor: Colors.red,
                //     title: Text('Item 1'),
                //   ),
                //   // Card(
                //   //   child: ListTile(
                //   //     title: Text('Card Item'),
                //   //     subtitle: Text('This is a card item'),
                //   //   ),
                //   // ),
                //   Expanded(
                //     child: ListTile(
                //       tileColor: Colors.red,
                //       title: Text('Item 1'),
                //     ),
                //   ),
                // ],
                children: List.generate(20, (index) {
                  return Card(
                    child: SizedBox(
                      height: 100,
                      child: Center(
                        child: Text(
                          'Item ${index + 1}',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          );
        }));
  }
}
