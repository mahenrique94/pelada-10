import 'package:flutter/material.dart';
import 'package:pelada_10/match.dart';

class LineUpPage extends StatelessWidget {
  final List<List<String>> teams;

  const LineUpPage({required this.teams, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Line up summary'),
      ),
      body: Column(children: [
        ...teams
            .map(
              (team) => Column(
                children: [
                  const Text('Team X'),
                  ...team.map((player) => Text(player)).toList(),
                ],
              ),
            )
            .toList(),
        ElevatedButton(
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MatchPage(teams: teams),
              ),
            )
          },
          child: Text('Start matches'),
        ),
      ]),
    );
  }

  Column createSummary() {
    return Column(
      children: [],
    );
  }
}
