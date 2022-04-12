class Symbol {
  Symbol(this.turn, this.playerId);
  int turn;
  int playerId;
}

class Gate {
  Gate(
      [this.activeGate = false,
      this.canBuild = false,
      List<Pillar>? large,
      List<Pillar>? middle,
      List<Pillar>? small])
      : large = large ?? [],
        middle = middle ?? [],
        small = small ?? [];
  bool activeGate;
  bool canBuild;
  List<Pillar> large;
  List<Pillar> middle;
  List<Pillar> small;
}

class Pillar {
  Pillar([this.turn = -1, this.playerId = -1]);
  int turn;
  int playerId;
}
