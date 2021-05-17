import 'package:flutter/material.dart';

class Healthbar extends StatelessWidget {
  final double hp;
  final double total;

  const Healthbar({Key key, this.hp, this.total}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double healthPercent = hp / total;
    Color color = _healthColor(healthPercent);
    return Container(
      height: 8,
      width: 50,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [color, color, Colors.transparent],
              stops: [0, healthPercent, healthPercent])),
    );
  }

  Color _healthColor(double healthPercent) {
    return healthPercent > 0.7
        ? Colors.green
        : healthPercent > 0.3
            ? Colors.orange
            : Colors.red;
  }
}
