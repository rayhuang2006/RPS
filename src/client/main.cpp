#include <iostream>
#include "BattleManager.h"

int main() {
    RPS::BattleManager manager;

    if (!manager.LoadDeck("assets/cards.json")) {
        std::cerr << "Failed to load cards!" << std::endl;
        return 1;
    }

    std::cout << "--- RPS Battle System Initialized ---" << std::endl;
    
    // Simulate a quick battle between the first and third card in the deck
    manager.RunQuickBattle(0, 2);

    return 0;
}