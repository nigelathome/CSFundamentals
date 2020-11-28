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

int Solution2::wiggleMaxLength(std::vector<int>& nums) {
    //找到上升子序列最后一个节点/下降子序列最后一个节点 这样才大概率再之后的序列中形成最大摇摆子序列
    //转态机的方式实现 出现转态转换len+1 否则等待该状态UP/DOWN的最后一个节点出现转态转换
    //UP->DOWN/DOWN->UP/BEGIN->UP/BEGIN->DOWN 都是出现了摇摆 那么长度+1
    if (nums.size() == 0) {
        return 0;
    }
    int max_len = 1;
    const int BEGIN = 1;
    const int UP = 2;
    const int DOWN = 3;
    int STATE = BEGIN;
    for (int i=1; i<nums.size(); i++) {
        switch (STATE) {
            case BEGIN:
                if (nums[i-1] < nums[i]) {
                    STATE = UP;
                    max_len++;
                } else if (nums[i-1] > nums[i]) {
                    STATE = DOWN;
                    max_len++;
                }
                break;
            case UP:
                if (nums[i-1] > nums[i]) {
                    STATE = DOWN;
                    max_len++;
                }
                break;
            case DOWN:
                if (nums[i-1] < nums[i]) {
                    STATE = UP;
                    max_len++;
                }
                break;
            default:
                break;
        }
    }
    return max_len;
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

/*
 std::vector<int> g, s;
 g.push_back(1);
 g.push_back(2);
 g.push_back(3);
 s.push_back(1);
 s.push_back(1);
 Solution2 solve;
 int child = solve.findContentChildren(g, s);
 printf("%d\n", child);
 */
