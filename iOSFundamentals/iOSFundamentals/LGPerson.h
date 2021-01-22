//
//  LGPerson.h
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/11/25.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LGPerson : NSObject <NSCoding>

@property (nonatomic, strong) NSArray *checkArray;
@property (nonatomic, strong) NSDictionary *addressDict;
@property (nonatomic, assign) int age;
@property (nonatomic, assign) long height;
@property (nonatomic, strong) NSString *hobby;

@property (nonatomic, copy) NSString *location;

- (void)print;
- (void)func;
//- (void)myFunc;

- (void)encodeWithCoder:(nonnull NSCoder *)coder;
- (nullable instancetype)initWithCoder:(nonnull NSCoder *)coder;

- (void)run;

@end

NS_ASSUME_NONNULL_END
