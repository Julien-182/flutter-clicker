import 'dart:math';

import 'package:flutter/material.dart';

class Enemy {
  double totalHp;
  double hp;
  int loot;
  Widget sprite;
  String name;

  Enemy(EnemyBuildParam param) {
    this.totalHp = param.hp;
    this.hp = this.totalHp;
    this.loot = param.loot;
    this.sprite = param.sprite;
    this.name = param.name;
  }
}

class EnemyBuildParam {
  double hp;
  int loot;
  Widget sprite;
  String name;

  EnemyBuildParam({this.name, this.hp, this.loot, this.sprite});

  static EnemyBuildParam blob = new EnemyBuildParam(
      name: "Blob",
      hp: 20,
      loot: 5,
      sprite: new Container(
        width: 50,
        height: 35,
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(36),
              topRight: Radius.circular(38),
              bottomLeft: Radius.circular(14),
              bottomRight: Radius.circular(20),
            )),
        child: Stack(
          children: [
            Positioned(
                bottom: 10,
                left: 14,
                child: Container(
                  height: 8,
                  width: 7,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                )),
            Positioned(
                bottom: 11,
                right: 15,
                child: Container(
                  height: 8,
                  width: 7,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                ))
          ],
        ),
      ));

  static EnemyBuildParam mouse = new EnemyBuildParam(
      name: "Mouse",
      hp: 10,
      loot: 2,
      sprite: new Container(
        constraints: BoxConstraints.tightForFinite(width: 50, height: 50),
        width: 50,
        height: 50,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(15)),
                )),
            Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(15)),
                )),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 40,
                  height: 25,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  alignment: Alignment.bottomCenter,
                )),
            Positioned(
                bottom: 10,
                left: 18,
                child: Container(
                  height: 6,
                  width: 4,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                )),
            Positioned(
                bottom: 10,
                right: 18,
                child: Container(
                  height: 6,
                  width: 4,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                ))
          ],
        ),
      ));

  static EnemyBuildParam fox = new EnemyBuildParam(
      name: "Fox",
      hp: 25,
      loot: 10,
      sprite: new Container(
        width: 50,
        height: 50,
        child: Stack(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Transform.rotate(
                    angle: -35,
                    child: Container(
                      width: 16,
                      height: 22,
                      decoration: BoxDecoration(
                          color: Colors.deepOrange[900],
                          borderRadius: BorderRadius.circular(10)),
                    ))),
            Align(
                alignment: Alignment.topRight,
                child: Transform.rotate(
                    angle: 35,
                    child: Container(
                      width: 16,
                      height: 22,
                      decoration: BoxDecoration(
                          color: Colors.deepOrange[900],
                          borderRadius: BorderRadius.circular(10)),
                    ))),
            Align(
                alignment: Alignment.bottomCenter,
                child: Transform.rotate(
                    alignment: Alignment.center,
                    angle: pi / 4,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(20))),
                    ))),
            Positioned(
                bottom: 18,
                left: 18,
                child: Container(
                  height: 6,
                  width: 4,
                  decoration: BoxDecoration(
                      color: Colors.deepOrange[900],
                      borderRadius: BorderRadius.circular(10)),
                )),
            Positioned(
                bottom: 18,
                right: 18,
                child: Container(
                  height: 6,
                  width: 4,
                  decoration: BoxDecoration(
                      color: Colors.deepOrange[900],
                      borderRadius: BorderRadius.circular(10)),
                ))
          ],
        ),
      ));

  static List<EnemyBuildParam> values = [blob, mouse, fox];
}
