//
//  GreedyTopic.hpp
//  CSAlgorithmsCpp
//
//  Created by Hui,Li on 2020/11/27.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#ifndef GreedyTopic_hpp
#define GreedyTopic_hpp

#include <stdio.h>

class Solution2 {
public:
    //322. 零钱兑换
    int coinChange(std::vector<int>& coins, int amount);
    
    //455. 分发饼干
    int findContentChildren(std::vector<int>& g, std::vector<int>& s);
    
    //376. 摆动序列
    int wiggleMaxLength(std::vector<int>& nums);
    
    //402. 移掉K位数字
    std::string removeKdigits(std::string num, int k);
    
    //55. 跳跃游戏
    bool canJump(std::vector<int>& nums);
};

#endif /* GreedyTopic_hpp */
