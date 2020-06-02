class Player {
  final String name;
  int sips;

  Player(this.name);

  void addSips(int amount) {
    sips += amount;
  }
}