#pragma once
#include "Types.h"

namespace RPS {

class BattleEngine {
public:
    static BattleResult Resolve(CardType a, CardType b) {
        int valA = static_cast<int>(a);
        int valB = static_cast<int>(b);
        int result = (valA - valB + 3) % 3;
        return static_cast<BattleResult>(result);
    }
};

} // namespace RPS