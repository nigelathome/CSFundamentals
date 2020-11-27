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

bool cmp(int a, int b) {
    return a<b;
}

int Solution2::findContentChildren(std::vector<int>& g, std::vector<int>& s) {
    //对胃口和饼干尺寸从小到大排序 从小的饼干开始依次判断能否满足孩子的胃口 能满足就满足该孩子 不能满足则尝试下一个饼干
    std::sort(g.begin(), g.end(), cmp);
    std::sort(s.begin(), s.end(), cmp);
    int child = 0, cookie = 0;
    while (child < g.size() && cookie < s.size()) {
        if (g[child] <= s[cookie]) {//说明该孩子的胃口可以被满足 记录该孩子
            child++;
        }
        cookie++;
    }
    return child;
}

#pragma mark code-test
/*
 std::vector<int> coins;
 coins.push_back(1);
 coins.push_back(2);
 coins.push_back(5);
 Solution2 solve;
 int count = solve.coinChange(coins, 11);
 printf("%d\n", count);
 */
