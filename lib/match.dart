import 'package:flutter/material.dart';

class MatchPage extends StatelessWidget {
  final List<List<String>> teams;

  const MatchPage({required this.teams, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matching'),
      ),
    );
  }
}
