//
//  TreeNode.m
//  CSFundamentals
//
//  Created by Hui,Li on 2019/12/3.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import "TreeNode.h"

@implementation TreeNode

- (instancetype)initWithValue:(NSInteger)val {
    if (self = [super init]) {
        self.val = val;
        self.left = nil;
        self.right = nil;
    }
    return self;
}

@end
