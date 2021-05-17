import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_clicker/model/enemy.dart';
import 'package:flutter_clicker/model/enemy_builder.dart';
import 'package:flutter_clicker/model/player.dart';
import 'package:flutter_clicker/widgets/enemies_display.dart';
import 'package:flutter_clicker/widgets/healthbar.dart';

import 'widgets/statbar.dart';

void main() {
  runApp(FlutterClickerApp());
}

class FlutterClickerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clicker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Clicker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Player _player;
  Enemy _enemy;
  bool _enemyHit = false;

  @override
  void initState() {
    _player = new Player();
    _generateNewEnemy();

    Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        double damage = (_player.dps / 10);
        _enemy.hp -= damage;
        if (_enemy.hp <= 0) {
          _enemy.hp = 0;
          _player.gold += _enemy.loot;
          _generateNewEnemy();
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Statbar(player: _player),
          IconButton(
              icon: Icon(Icons.text_snippet),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EnemiesDisplay()));
              })
        ],
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${_player.gold} \$',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: 20,
            ),
            _enemyWidget(),
            SizedBox(
              height: 14,
            ),
            Healthbar(
              hp: _enemy.hp,
              total: _enemy.totalHp,
            ),
            SizedBox(
              height: 4,
            ),
            Text("${_enemy.hp.round()} hp",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 12))
          ],
        ),
      ),
    );
  }

  Widget _enemyWidget() {
    return GestureDetector(
      child: _enemyHit
          ? ColorFiltered(
              colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
              child: _enemy.sprite)
          : _enemy.sprite,
      onTapDown: (tap) {
        if (_enemy.hp <= 0) return;
        _enemy.hp -= _player.clickDamage;
        _enemyHit = true;
      },
      onTapUp: (tap) {
        _enemyHit = false;
      },
    );
  }

  void _generateNewEnemy() {
    _enemy = EnemyBuilder.generateEnemy();
  }
}
