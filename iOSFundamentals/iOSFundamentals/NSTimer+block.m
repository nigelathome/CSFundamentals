//
//  NSTimer+block.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/24.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "NSTimer+block.h"

@implementation NSTimer (block)

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti
                                      block:(void (^)(void))block
                                    repeats:(BOOL)yesOrNo {
    return [self scheduledTimerWithTimeInterval:ti target:self selector:@selector(invoke_timer:) userInfo:[block copy] repeats:yesOrNo];
}

- (void)invoke_timer:(NSTimer *)timer {
    void (^block)(void) = timer.userInfo;//通过传递userInfo执行定时器任务
    if (block) {
        block();
    }
}

@end
