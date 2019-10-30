//
//  GreedyTopics.h
//  CSFundamentals
//
//  Created by Hui,Li on 2019/10/30.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GreedyTopics : NSObject

//分糖果assign cookies
- (NSUInteger)findCotentChildren:(NSArray<NSNumber*>*)g withCookies:(NSArray<NSNumber*>*)s;

@end

NS_ASSUME_NONNULL_END
