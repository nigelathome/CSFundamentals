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

@implementation CoursePair

- (instancetype)initWithCourse:(NSUInteger)course dependency:(NSUInteger)dependency {
    self = [super init];
    if (self) {
        _course = course;
        _dependency = dependency;
    }
    return self;
}

@end

@implementation Course

- (instancetype)initWithValue:(NSUInteger)value {
    self = [super initWithValue:value];
    if (self) {
        _visitStatus = -1;
        _degree = 0;
    }
    return self;
}

@end

