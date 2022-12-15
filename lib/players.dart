import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pelada_10/line_up.dart';

class PlayersPage extends StatefulWidget {
  const PlayersPage({super.key});

  @override
  _PlayersPageState createState() => _PlayersPageState();
}

class _PlayersPageState extends State<PlayersPage> {
  final TextEditingController playersNameController = TextEditingController();
  final List<String> players = [];

  @override
  void dispose() {
    playersNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Players Management'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: playersNameController,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  players.add(playersNameController.text);
                  playersNameController.clear();
                });
              },
              child: const Text('Add player to list'),
            ),
            Expanded(
                child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Text(players[index]),
                  padding: const EdgeInsets.all(4),
                );
              },
              itemCount: players.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            )),
            ElevatedButton(
              onPressed: () {
                const countOfTeams = 2;
                const playersForTeam = 3;
                const playersToPlay = playersForTeam * countOfTeams;
                int remainingPlayers = playersToPlay - players.length;

                if (players.length != playersToPlay) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Teams sorting validation'),
                      content: Text(
                          'You need add more $remainingPlayers player to sorting $countOfTeams teams of $playersForTeam players.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('Ok'),
                        ),
                      ],
                    ),
                  );
                } else {
                  List<List<String>> teams = [];
                  List<String> playersToSort = List.from(players);

                  for (int i = 0; i < countOfTeams; i++) {
                    List<String> team = [];

                    for (int k = 0; k < playersForTeam; k++) {
                      team.add(playersToSort
                          .removeAt(Random().nextInt(playersToSort.length)));
                    }

                    teams.add(List.from(team));
                    team.clear();
                  }

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LineUpPage(teams: teams),
                      ));
                }
              },
              child: const Text('Sort teams'),
            ),
          ],
        ),
      ),
    );
  }
}
