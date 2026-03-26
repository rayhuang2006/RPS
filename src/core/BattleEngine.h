#pragma once

namespace RPS{
    enum class CardType{
        Rock = 0,
        Paper = 1,
        Scissors = 2
    };

    enum class BattleResult{
        Draw = 0,
        PlayerAWin = 1,
        PlayerBWin = 2
    };

    class BattleEngine{
    public:
        static BattleResult Resolve(CardType a, CardType b){
            int valA = static_cast<int>(a);
            int valB = static_cast<int>(b);

            int result = (valA - valB + 3) % 3;

            return static_cast<BattleResult>(result);
        }
    };
}