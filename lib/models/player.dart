import 'dart:math';

class Player {
  final String name;

  static var rng = new Random();
  int sips = rng.nextInt(25);

  Player(this.name);

  void addSips(int amount) {
    sips += amount;
  }
}