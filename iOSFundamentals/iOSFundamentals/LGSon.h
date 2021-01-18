//
//  LGSon.h
//  iOSFundamentals
//
//  Created by Hui,Li on 2021/1/18.
//  Copyright © 2021 Hui,Li. All rights reserved.
//

#import "LGFather.h"

NS_ASSUME_NONNULL_BEGIN

@interface LGSon : LGFather

@property (nonatomic, assign) NSUInteger age;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, strong) NSArray *hobbies;

@end

NS_ASSUME_NONNULL_END
