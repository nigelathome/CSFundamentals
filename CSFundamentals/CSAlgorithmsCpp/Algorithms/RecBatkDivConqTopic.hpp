//
//  RecBatkDivConqTopic.hpp
//  CSAlgorithmsCpp
//
//  Created by Hui,Li on 2020/11/28.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#ifndef RecBatkDivConqTopic_hpp
#define RecBatkDivConqTopic_hpp

#include <stdio.h>

class Solution3 {
public:
    //78. 子集
    std::vector<std::vector<int>> subsets(std::vector<int>& nums);
    
    //90. 子集 II
    std::vector<std::vector<int>> subsetsWithDup(std::vector<int>& nums);
    
    //22. 括号生成
    std::vector<std::string> generateParenthesis(int n);
};

#endif /* RecBatkDivConqTopic_hpp */
