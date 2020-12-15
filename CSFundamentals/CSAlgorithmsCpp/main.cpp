//
//  main.cpp
//  CSAlgorithmsCpp
//
//  Created by Hui,Li on 2020/11/21.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#include <iostream>

using namespace std;

int main(int argc, const char * argv[]) {
    std::cout << "Hello, US!\n";
    std::cout << "Hello, CHINA!\n";
    
    Solution7 solve;
    std::string t = "youzan";
    std::string s = "zanyouzanyou";
    std::string a = s + s;
    bool match = solve.BF(s, t);
    std::cout << std::boolalpha << match << endl;
    

    return 0;
}
