//
//  GreedyTopic.cpp
//  CSAlgorithmsCpp
//
//  Created by Hui,Li on 2020/11/27.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#include "GreedyTopic.hpp"

int Solution2::coinChange(std::vector<int>& coins, int amount) {
    int count = 0, x = 0;
    //最大金额开始 贪心法则
    for (int i = (int)coins.size() - 1; i>=0; i--) {
        x = amount/coins[i];
        amount -= x * coins[i];
        count += x;
    }
    return amount != 0 ? -1 : count;
}
