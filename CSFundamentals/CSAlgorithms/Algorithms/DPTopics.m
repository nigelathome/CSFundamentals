//
//  DPTopics.m
//  CSAlgorithms
//
//  Created by Hui,Li on 2019/10/3.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import "DPTopics.h"

@implementation DPTopics

- (NSInteger)climbStairs:(NSInteger)n {
    NSMutableArray *dp = [NSMutableArray array]; //创建dp数组
    for (NSInteger i = 0; i < n+1; i++)
        [dp addObject:[NSNumber numberWithInteger:0]];
    dp[1] = @1;
    dp[2] = @2;
    
    for (NSInteger i = 3; i <= n; i++) {
        NSInteger dpiValue = [dp[i-1] integerValue] + [dp[i-2] integerValue];
        dp[i] = [NSNumber numberWithInteger:dpiValue];
    }
    
    return [dp[n] integerValue];
}

#pragma test-code
/*
 DPTopics *dPTopics = [[DPTopics alloc] init];
 NSInteger total = [dPTopics climbStairs:4];
 NSLog(@"%ld\n", (long)total);
 */

@end
