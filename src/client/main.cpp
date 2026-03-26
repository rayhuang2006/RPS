#include <iostream>
#include <fstream>
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

    for (auto& item : data) {
        RPS::Card c;
        c.name = item["name"];
        c.attack = item["attack"];
        std::cout << "Load Card: " << c.name << " (Attack: " << c.attack << ")" << std::endl;
    }

    return 0;
}