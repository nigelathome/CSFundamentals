//
//  Queue.m
//  CSFundamentals
//
//  Created by Hui,Li on 2019/10/18.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import "Queue.h"

@interface Queue()

@property(nonatomic)NSMutableArray *queueArray;

@end

@implementation Queue

- (nullable id)back {
    if ([self empty])
        return nil;
    return [self.queueArray lastObject];
}

- (BOOL)empty {
    return [self.queueArray count] == 0;
}

- (nullable id)front {
    if ([self empty])
        return nil;
    return [self.queueArray firstObject];
}

- (void)pop {
    [self.queueArray removeObjectAtIndex:0];
}

- (void)push:(id)obj {
    [self.queueArray addObject:obj];
}

- (NSInteger)size {
    return [self.queueArray count];
}

- (void)removeAllObjects {
    [self.queueArray removeAllObjects];
}

#pragma mark - lazy
- (NSMutableArray *)queueArray {
    if (!_queueArray) {
        _queueArray = [NSMutableArray array];
    }
    return _queueArray;
}

@end
