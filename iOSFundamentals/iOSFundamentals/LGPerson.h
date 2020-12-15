//
//  LGPerson.h
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/11/25.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LGPerson : NSObject

@property (nonatomic, assign) int age;
@property (nonatomic, assign) long height;
@property (nonatomic, strong) NSString *hobby;

- (void)print;
- (void)func;
//- (void)myFunc;

@end

NS_ASSUME_NONNULL_END
