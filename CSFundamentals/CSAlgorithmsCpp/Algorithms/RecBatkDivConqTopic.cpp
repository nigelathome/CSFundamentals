//
//  RecBatkDivConqTopic.cpp
//  CSAlgorithmsCpp
//
//  Created by Hui,Li on 2020/11/28.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#include "RecBatkDivConqTopic.hpp"

void generate_subset(int i, std::vector<int> nums,
                     std::vector<int> &item,
                     std::vector<std::vector<int>> &result) {
    if (i>=nums.size()) {
        return;
    }
    //加入该元素情况下进行尝试
    item.push_back(nums[i]);
    result.push_back(item);
    generate_subset(i+1, nums, item, result);
    
    //不加入该元素情况下进行尝试
    item.pop_back();
    generate_subset(i+1, nums, item, result);
}

std::vector<std::vector<int>> Solution3::subsets(std::vector<int>& nums) {
    std::vector<std::vector<int>> result;
    std::vector<int> item;
    //加入空集
    result.push_back(item);
    generate_subset(0, nums, item, result);
    return result;
}

void generate_subset_duplicate_element(int i,
                                       std::vector<int> &nums,
                                       std::vector<int> &item,
                                       std::set<std::vector<int>> &item_set,
                                       std::vector<std::vector<int>> &result) {
    if (i>=nums.size()) {
        return;
    }
    item.push_back(nums[i]);
    if (item_set.find(item) == item_set.end()) {//不重复的集合则加入result
        result.push_back(item);
        item_set.insert(item);//set记录该元素
    }
    generate_subset_duplicate_element(i+1, nums, item, item_set, result);
    
    item.pop_back();
    generate_subset_duplicate_element(i+1, nums, item, item_set, result);
}

std::vector<std::vector<int>> Solution3::subsetsWithDup(std::vector<int>& nums) {
    std::vector<std::vector<int>> result;
    std::vector<int> item;
    std::set<std::vector<int>> item_set; //用来进行去重
    std::sort(nums.begin(), nums.end());//默认从小到大排序
    result.push_back(item);//加入空集
    generate_subset_duplicate_element(0, nums, item, item_set, result);
    return result;
}

void get_parenthesis(int n,
                     int left,
                     int right,
                     std::string item,
                     std::vector<std::string> &result) {
    if (left == n && right == n) {
        result.push_back(item);
        return;
    }
    
    //进行左括号的尝试
    if (left <= n) {
        item.append(1, '(');
        get_parenthesis(n, left+1, right, item, result);
        item.erase(item.size()-1);
    }
    //保证括号的合法性 左括号必须比右括号多的时候才能尝试左括号
    if (right < left && right <n) {
        //进行右括号的尝试
        item.append(1, ')');
        get_parenthesis(n, left, right+1, item, result);
    }
  
}

std::vector<std::string> Solution3::generateParenthesis(int n) {
    std::vector<std::string> result;
    std::string item;
    get_parenthesis(n, 0, 0, item, result);
    return result;
}

void combination_sum(int i,
                     int sum,
                     int target,
                     std::vector<int> candidates,
                     std::vector<int> item,
                     std::set<std::vector<int>> &item_set,
                     std::vector<std::vector<int>> &result) {
    if (i >= candidates.size()
        || sum>target) {//剪枝 之后的元素不在进行尝试
        return;
    }
    item.push_back(candidates[i]);
    sum += candidates[i];
    if (sum == target &&
        item_set.find(item) == item_set.end()) {//不重复
        item_set.insert(item);
        result.push_back(item);
        return;//剪枝 之后的元素不在进行尝试
    }
    combination_sum(i+1, sum, target, candidates, item, item_set, result);
    //回溯 不加入该元素进行递归尝试
    item.pop_back();
    sum -= candidates[i];
    combination_sum(i+1, sum, target, candidates, item, item_set, result);
}

std::vector<std::vector<int>> Solution3::combinationSum2(std::vector<int>& candidates, int target) {
    std::vector<std::vector<int>> result;
    std::vector<int> item;
    std::set<std::vector<int>> item_set;
    std::sort(candidates.begin(), candidates.end());//从小到大排序减少不必要的尝试
    combination_sum(0, 0, target, candidates, item, item_set, result);
    return result;
}

//x,y的方向数组 标识(x,y)相邻的8个位置
static int dx[] = {-1, 0, 1, -1, 1, -1, 0, 1};
static int dy[] = {-1, -1, -1, 0, 0, 1, 1, 1};

void put_down_queen(int x, int y, std::vector<std::vector<int>> &mark) {
    //把queen放在(x,y)位置后更新棋盘的标记 其中0标识可放置 1标识不可放置
    mark[x][y] = 1;
    for(int i = 0; i<mark.size(); i++) {//偏移
        for (int j=0; j<8; j++) {//8个方向
            int new_x = x + dx[j]*i;
            int new_y = y + dy[j]*i;
            if (new_x>=0 && new_x<mark.size()
                && new_y>=0 && new_y<mark.size()) {
                mark[new_x][new_y] = 1;
            }
        }
    }
}

void generate_queen(int k, int n, std::vector<std::string> &location, std::vector<std::vector<int>> &mark, std::vector<std::vector<std::string>> &result) {
    if (k==n) {//放置了n个皇后 将结果保存
        result.push_back(location);
        return;
    }
    for (int col=0; col<mark.size(); col++) {//从第k行一次遍历第k行的0->mark.size()列 找一个可以放的位置并以此再进行递归放置的操作
        if (mark[k][col] == 0) {
            std::vector<std::vector<int>> tmp_mark = mark;
            put_down_queen(k, col, mark);//把queen放置k,col，然后进行下一次递归
            location[k][col] = 'Q';
            generate_queen(k+1, n, location, mark, result);
            
            //回溯 进行下一次尝试
            mark = tmp_mark;
            location[k][col] = '.';
        }
    }
}

std::vector<std::vector<std::string>> Solution3::solveNQueens(int n) {
    std::vector<std::vector<std::string>> result;
    std::vector<std::string> location;//存放每次的摆放
    std::vector<std::vector<int>> mark;//棋盘
    for (int i=0; i<n; i++) {//初始化棋盘
        std::vector<int> mark_row;
        std::string location_row;
        for (int j=0; j<n; j++) {
            mark_row.push_back(0);
            location_row.append(1, '.');
        }
        mark.push_back(mark_row);
        location.push_back(location_row);
    }
    
    generate_queen(0, n, location, mark, result);
    return result;
}

//上、左、右、下 方向数组
static int x[] = {0, -1, 0, 1};
static int y[] = {-1, 0, 1, 0};

void dfs_find_path(std::vector<std::vector<char>> &board, int row, int col,
                   std::string word, int len,
                   bool &is_find) {
    if (len==word.size()) {
        is_find = true;
        return;
    }
    if (is_find) {
        return;
    }
    
    if (row>=0 && row<board.size() && col>=0 && col<board[0].size()) {
        if (board[row][col]==word[len]) {
            //防止重复下一次搜索到该元素 将其置为一个永远不可能相等的符号 在回溯会该轮递归的时候再置回来
            char t = board[row][col];
            board[row][col] = '*';
            
            for (int i=0; i<4; i++) {
                int new_x = row + x[i];
                int new_y = col + y[i];
                dfs_find_path(board, new_x, new_y, word, len+1, is_find);
            }
            
            board[row][col] = t;
        }
    }
}

bool Solution3::exist(std::vector<std::vector<char>>& board, std::string word) {
    bool result = false;
    for (int i=0; i<board.size(); i++) {
        for (int j=0; j<board[0].size(); j++) {
            dfs_find_path(board, i, j, word, 0, result);
        }
    }
    return result;
}

int dit_sum(int v) {
    int sum = 0;
    while(v) {
        sum += v % 10;
        v /= 10;
    }
    return sum;
}

void get_move(std::vector<std::vector<char>> &matrix, int row, int col, int k, int &cnt) {
    if (row>=matrix.size() || row<0
        || col>=matrix[0].size() || col<0
        || matrix[row][col]=='#') {
        return;
    }
   
    matrix[row][col] = '#';
    //计算格子行和列的位数和
    int sum = dit_sum(row);
    sum += dit_sum(col);
    if (sum<=k) {
        cnt++;
        for (int i=0; i<4; i++) {
            int new_x = row + x[i];
            int new_y = col + y[i];
            get_move(matrix, new_x, new_y, k, cnt);
        }
    }
}

int Solution3::movingCount(int m, int n, int k) {
    int result = 0;
    //建立一个m行n列的矩阵 *表示可以走 #表示不能走
    std::vector<std::vector<char>> M(m, std::vector<char>(n, '*'));
    //dfs计算满足条件的格子 从左上角(0, 0)开始
    get_move(M, 0, 0, k, result);
    
    return result;
}

void cal_p(std::vector<std::vector<int>> M, std::vector<std::vector<int>> &p) {
    //从右下角开始计算p矩阵每个元素的值
    //p[i][j] 代表从(i,j)位置作为起点 走到右下角目标位置的最小路径。所以p[0][0]就是从左上角走到右下角的最小路径
    for(int i=(int)p.size()-1; i>=0; i--) {
        for(int j=(int)p[0].size()-1; j>=0; j--) {
            if(i==p.size()-1 && j==p[0].size()-1) {
                p[i][j] = M[i][j];//右下角
            } else if(i+1>p.size()-1) {
                p[i][j] = p[i][j+1]+ M[i][j];//最下面一行
            } else if(j+1>p[0].size()-1) {
                p[i][j] = p[i+1][j] + M[i][j];//最右面一行
            } else {
                p[i][j] = std::min(p[i+1][j], p[i][j+1]) + M[i][j];
            }
        }
    }
}

int Solution3::minPathSum(std::vector<std::vector<int> >& matrix) {
    std::vector<std::vector<int>> p(matrix.size(), std::vector<int>(matrix[0].size(), 0));
    cal_p(matrix, p);
    return p[0][0];
}

#pragma mark code-test
/*
 void calculate(int n, int &sum) {
     if (n==0) {
         return;
     }
     sum += n;
     calculate(n-1, sum);
 }

 int sum = 0;
 calculate(20, sum);
 printf("%d\n", sum);
 */

/*
 void add_to_vector(ListNode *head, std::vector<int> &vec) {
     if (!head) {
         return;
     }
     vec.push_back(head->val);
     add_to_vector(head->next, vec);
 }
 
 ListNode a(1);
 ListNode b(2);
 ListNode c(3);
 ListNode d(4);
 ListNode e(5);
 a.next = &b;
 b.next = &c;
 c.next = &d;
 d.next = &e;
 std::vector<int> vec;
 add_to_vector(&a, vec);
 for (int i=0; i<vec.size(); i++) {
     printf("%d\n", vec[i]);
 }
 */

/*
 std::vector<int> nums;
 nums.push_back(1);
 nums.push_back(2);
 nums.push_back(2);
 Solution3 solve;
 std::vector<std::vector<int>> result = solve.subsetsWithDup(nums);
 for (int i=0; i<result.size(); i++) {
     for (int j=0; j<result[i].size(); j++) {
         printf("%d", result[i][j]);
     }
     printf("\n");
 }
 */

/*
 int n = 3;
 Solution3 solve;
 std::vector<std::string> result = solve.generateParenthesis(n);
 for (int i=0; i<result.size(); i++) {
     string item = result[i];
     printf("%s\n", item.c_str());
 }
 */

/*
     std::vector<int> candidates;
 //    candidates.push_back(10);
 //    candidates.push_back(1);
 //    candidates.push_back(2);
 //    candidates.push_back(7);
 //    candidates.push_back(6);
 //    candidates.push_back(1);
 //    candidates.push_back(5);
 //    int target = 8;
     candidates.push_back(2);
     candidates.push_back(5);
     candidates.push_back(2);
     candidates.push_back(1);
     candidates.push_back(2);
     int target = 5;
     Solution3 solve;
     std::vector<std::vector<int>> result = solve.combinationSum2(candidates, target);
     for (int i=0; i<result.size(); i++) {
         for (int j=0; j<result[i].size(); j++) {
             printf("%d", result[i][j]);
         }
         printf("\n");
     }
 */

/*
 Solution3 solve;
 int n = 5;
 std::vector<std::vector<std::string>> result;
 result = solve.solveNQueens(n);
 printf("n=%d\n", n);
 for (int i=0; i<result.size(); i++) {
     for (int j=0; j<result[i].size(); j++) {
         printf("%s\n", result[i][j].c_str());
     }
     printf("\n");
 }
 */

/*
 std::vector<std::vector<char>> board1 = {{'a','b','c','e'}, {'s','f','c','s'}, {'a','d','e','e'}};
 std::string word1 ="abcced";
 
 Solution3 solve;
 bool is_exist = solve.exist(board1, word1);
 std::cout << boolalpha << is_exist << endl;
 */

/*
 Solution3 solve;
 int cnt = solve.movingCount(16, 8, 4);
 std::cout << cnt << endl;
 */

