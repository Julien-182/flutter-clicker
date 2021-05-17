import 'dart:math';

import 'enemy.dart';

class EnemyBuilder {
  static Enemy generateEnemy() {
    EnemyBuildParam type = EnemyBuildParam.values
        .elementAt(Random().nextInt(EnemyBuildParam.values.length));

    return new Enemy(type);
  }

  static Enemy generateEnemyFromType(EnemyBuildParam type) {
    return new Enemy(type);
  }
}
