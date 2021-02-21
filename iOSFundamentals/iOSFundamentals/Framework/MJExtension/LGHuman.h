//
//  LGHuman.h
//  iOSFundamentals
//
//  Created by Hui,Li on 2021/1/22.
//  Copyright © 2021 Hui,Li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "singleton.h"

NS_ASSUME_NONNULL_BEGIN

@interface LGHuman : NSObject

@property (nonatomic, assign) NSInteger age;
@property (nonatomic, copy) NSString *gender;

singleton_h(LGHuman)

@end

NS_ASSUME_NONNULL_END
