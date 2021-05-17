import 'package:flutter/material.dart';
import 'package:flutter_clicker/model/player.dart';

class Statbar extends StatelessWidget {
  final Player player;

  const Statbar({Key key, this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("${player.clickDamage}"),
        Icon(Icons.swipe),
        SizedBox(width: 12),
        Text("${player.dps}"),
        Icon(Icons.timer),
      ],
    );
  }
}
