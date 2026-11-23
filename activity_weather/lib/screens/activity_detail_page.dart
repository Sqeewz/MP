import 'package:flutter/material.dart';

class ActivityDetailPage extends StatelessWidget {
  final Map<String, String> activity;

  const ActivityDetailPage({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(activity['title'] ?? ''),
      ),
      body: Center(
        child: Text(activity['detail'] ?? ''),
      ),
    );
  }
}
