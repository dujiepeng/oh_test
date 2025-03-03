import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({this.result, super.key});
  final Object? result;
  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    String result = widget.result.toString();
    int count = 0;
    if (widget.result is List) {
      count = (widget.result as List).length;
      result = "count: $count, $result";
    }

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(result),
      ),
    );
  }
}
