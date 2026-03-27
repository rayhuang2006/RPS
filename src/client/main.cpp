#include <iostream>
#include <fstream>
#include <vector>
#include <nlohmann/json.hpp>
#include "Card.h"

using json = nlohmann::json;

int main() {

    std::ifstream f("assets/cards.json");
    if (!f.is_open()) {
        std::cerr << " Cannot find the file!" << std::endl;
        return 1;
    }

    json data = json::parse(f);

    // for (auto& item : data) {
    //     RPS::Card c;
    //     c.name = item["name"];
    //     c.attack = item["attack"];
    //     std::cout << "Load Card: " << c.name << " (Attack: " << c.attack << ")" << std::endl;
    // }

    std::vector<RPS::Card> deck;

    for (auto& item : data) {
        RPS::Card c;
        c.id = item["id"];
        c.name = item["name"];
        c.type = static_cast<RPS::CardType>(item["type"].get<int>());
        c.attack = item["attack"];
        c.hp = item["hp"];
        deck.push_back(c);
    }

    RPS::Card& p1 = deck[0];
    RPS::Card& p2 = deck[2];

    std::cout << "Battle Start: " << p1.name << " VS " << p2.name << std::endl;

    RPS::BattleResult result = RPS::BattleEngine::Resolve(p1.type, p2.type);

    if (result == RPS::BattleResult::PlayerAWin) {
        p2.hp -= p1.attack;
        std::cout << "Result：" << p1.name << " Win! Deals " << p1.attack << " damages to " << p2.name << std::endl;
        std::cout << p2.name << " Remaining HP: " << p2.hp << std::endl;
    } else if (result == RPS::BattleResult::PlayerBWin) {
        p1.hp -= p2.attack;
        std::cout << "Result：" << p2.name << " Win! Deals " << p2.attack << " damages to " << p1.name << std::endl;
        std::cout << p1.name << " Remaining HP: " << p1.hp << std::endl;
    } else {
        std::cout << "Result: Draw!" << std::endl;
    }

    return 0;
}