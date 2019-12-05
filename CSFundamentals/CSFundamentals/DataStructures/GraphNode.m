//
//  GraphNode.m
//  CSFundamentals
//
//  Created by Hui,Li on 2019/12/5.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import "GraphNode.h"

@implementation GraphNode

- (instancetype)initWithValue:(NSUInteger)value {
    
    if (self = [super init]) {
        _val = value;
        _neighbors = [[NSMutableArray alloc] init];
        _isVisited = NO;
    }
    return self;
}

@end
