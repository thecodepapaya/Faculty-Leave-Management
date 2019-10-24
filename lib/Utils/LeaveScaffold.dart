import 'package:flutter/material.dart';

class LeaveScaffold extends StatefulWidget {
  final String title;
  final Widget body;
  final Widget floatingButton;
  LeaveScaffold({
    @required this.body,
    @required this.title,
    this.floatingButton,
  });
  @override
  _LeaveScaffoldState createState() => _LeaveScaffoldState();
}

class _LeaveScaffoldState extends State<LeaveScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: widget.body,
      floatingActionButton: widget.floatingButton,
    );
  }
}
