#pragma once
#include <vector>
#include <string>
#include <fstream>
#include <iostream>
#include <nlohmann/json.hpp>
#include "Card.h"
#include "BattleEngine.h"

namespace RPS {

class BattleManager {
private:
    std::vector<Card> deck;

public:
    // Load cards from a JSON file into the deck    
    bool LoadDeck(const std::string& filename) {
        std::ifstream f(filename);
        if (!f.is_open()) return false;

        nlohmann::json data = nlohmann::json::parse(f);
        deck.clear();

        for (auto& item : data) {
            Card c;
            c.id = item["id"];
            c.name = item["name"];
            c.type = static_cast<CardType>(item["type"].get<int>());
            c.attack = item["attack"];
            c.hp = item["hp"];
            deck.push_back(c);
        }
        return true;
    }

    // Run a quick battle between two cards by their indices in the deck
    void RunQuickBattle(int indexA, int indexB) {
        if (indexA >= deck.size() || indexB >= deck.size()) return;

        Card& p1 = deck[indexA];
        Card& p2 = deck[indexB];

        std::cout << "[Battle] " << p1.name << " VS " << p2.name << std::endl;

        BattleResult res = BattleEngine::Resolve(p1.type, p2.type);

        if (res == BattleResult::PLAYER_A_WINS) {
            p2.hp -= p1.attack;
            std::cout << ">> " << p1.name << " wins! Deals " << p1.attack << " damage." << std::endl;
        } else if (res == BattleResult::PLAYER_B_WINS) {
            p1.hp -= p2.attack;
            std::cout << ">> " << p2.name << " wins! Deals " << p2.attack << " damage." << std::endl;
        } else {
            std::cout << ">> It's a DRAW!" << std::endl;
        }
    }
};

} // namespace RPS