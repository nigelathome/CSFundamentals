//
//  Node.hpp
//  CSAlgorithmsCpp
//
//  Created by Hui,Li on 2020/11/23.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#ifndef Node_hpp
#define Node_hpp

#include <stdio.h>

class Node {
public:
    int val;
    Node* next;
    Node* random;
    
    Node(int _val);
};

#endif /* Node_hpp */
