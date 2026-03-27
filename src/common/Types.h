#pragma once

namespace RPS {

enum class CardType : int {
    ROCK = 0,
    PAPER = 1,
    SCISSORS = 2
};

enum class BattleResult {
    DRAW = 0,
    PLAYER_A_WINS = 1,
    PLAYER_B_WINS = 2
};

} // namespace RPS