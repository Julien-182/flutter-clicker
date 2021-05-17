import 'package:flutter/material.dart';
import 'package:flutter_clicker/model/enemy.dart';
import 'package:flutter_clicker/model/enemy_builder.dart';

class EnemiesDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Enemy> enemies = EnemyBuildParam.values
        .map((e) => EnemyBuilder.generateEnemyFromType(e))
        .toList();

    return Scaffold(
        appBar: AppBar(),
        body: ListView.separated(
            padding: EdgeInsets.all(4),
            itemCount: enemies.length,
            separatorBuilder: (context, index) =>
                SizedBox(height: 12, child: Divider()),
            itemBuilder: (context, i) {
              Enemy enemy = enemies.elementAt(i);
              return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(enemy.name),
                    SizedBox(height: 4),
                    enemy.sprite
                  ]);
            }));
  }
}
