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
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(widget.result.toString()),
      ),
    );
  }
}
