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
    
    WordDictionary word_dictionary;
    word_dictionary.addWord("bad");
    word_dictionary.addWord("dad");
    word_dictionary.addWord("mad");
    
    std::cout << std::boolalpha << word_dictionary.search("pad") << endl;
    std::cout << std::boolalpha << word_dictionary.search("bad") << endl;
    std::cout << std::boolalpha << word_dictionary.search(".ad") << endl;
    std::cout << std::boolalpha << word_dictionary.search("b..") << endl;

    return 0;
}
