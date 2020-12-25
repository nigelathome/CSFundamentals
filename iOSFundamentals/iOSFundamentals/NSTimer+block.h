//
//  NSTimer+block.h
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/24.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (block)

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti block:(void (^)(void))block repeats:(BOOL)yesOrNo;
    
@end

NS_ASSUME_NONNULL_END
