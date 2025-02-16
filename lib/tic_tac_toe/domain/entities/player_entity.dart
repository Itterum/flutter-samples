enum PlayerType { cross, circle }

class PlayerEntity {
  final PlayerType playerType;

  PlayerEntity(this.playerType);

  PlayerEntity copyWith({PlayerType? playerType}) {
    return PlayerEntity(playerType ?? this.playerType);
  }
}
