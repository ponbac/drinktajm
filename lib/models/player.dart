class Player {
  final String name;
  int sips = 0;

  Player(this.name);

  void addSips(int amount) {
    sips += amount;
  }
}