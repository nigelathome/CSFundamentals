//
//  LGImageLoader.h
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/23.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef BOOL (^TaskBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface LGImageLoader : NSObject <NSCopying>

+ (instancetype)shareInstance;
- (void)addTask:(TaskBlock)taskBlock;

@end

NS_ASSUME_NONNULL_END
