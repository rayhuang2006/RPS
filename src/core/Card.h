#pragma once
#include <string>
#include "Types.h"

namespace RPS {

struct Card {
    int id;
    std::string name;
    CardType type;
    int attack;
    int hp;
};

} // namespace RPS