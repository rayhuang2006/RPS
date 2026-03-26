#pragma once
#include <string>
#include "BattleEngine.h"

namespace RPS {

struct Card {
    int id;
    std::string name;
    CardType type;
    int attack;
    int hp;
};

} 