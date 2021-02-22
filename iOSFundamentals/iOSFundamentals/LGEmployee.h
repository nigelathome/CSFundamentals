//
//  LGEmployee.h
//  iOSFundamentals
//
//  Created by Hui,Li on 2021/2/22.
//  Copyright © 2021 Hui,Li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LGEmployee : NSObject

@property (nonatomic, assign) NSInteger epl_id;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;

@end

NS_ASSUME_NONNULL_END
