//
//  ListNode.m
//  CSFundamentals
//
//  Created by Hui,Li on 2019/10/2.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import "ListNode.h"

@implementation ListNode

- (instancetype)initWithValue:(NSInteger)val {
    if (self = [super init]) {
        self.val = val;
        self.next = nil;
    }
    return self;
}

- (instancetype)initListNode:(ListNode *)node {
    if (self = [super init]) {
        self.val = node.val;
        self.next = node.next;
    }
    return self;
}

@end
