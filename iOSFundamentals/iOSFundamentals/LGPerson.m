//
//  LGPerson.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/11/25.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "LGPerson.h"

@interface LGPerson ()

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSString *pName;

@end

@implementation LGPerson

- (void)print {
    NSLog(@"%@", self.name);//self.name指向ClassObjectViewController的isa指针 所以输出是ClassObjectViewController
}

@end
