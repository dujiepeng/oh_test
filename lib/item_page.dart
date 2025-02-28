import 'package:flutter/material.dart';
import 'package:test_oh/result_page.dart';

typedef ListenerCallback = void Function(BuildContext ctx);
typedef CallbackHandler = Future<Object?>? Function();

class Item {
  Item({required this.title, this.onTap, this.nextPage});

  final String title;
  final CallbackHandler? onTap;
  final ItemsPage? nextPage;
}

// ignore: must_be_immutable
class ItemsPage extends StatefulWidget {
  ItemsPage({
    super.key,
    this.title,
    this.items,
    this.addListenerCallback,
    this.removeListenerCallback,
  });
  String? title;
  List<Item>? items;

  ListenerCallback? addListenerCallback;
  ListenerCallback? removeListenerCallback;

  @override
  State<StatefulWidget> createState() => ItemsPageState();
}

class ItemsPageState extends State<ItemsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
      ),
      body: ListView(children: () {
        final List<Widget> children = [];
        if (widget.items != null) {
          for (final item in widget.items!) {
            children.add(
              Container(
                color: item.nextPage != null ? Colors.lime : Colors.white,
                child: ListTile(
                    title: Text(item.title),
                    onTap: () {
                      if (item.onTap != null) {
                        item.onTap!()?.then((value) {
                          if (value != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => ResultPage(result: value)),
                            );
                          }
                        });
                      } else if (item.nextPage != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (ctx) => item.nextPage!),
                        );
                      }
                    }),
              ),
            );
          }
        }

        return children;
      }()),
    );
  }
}
