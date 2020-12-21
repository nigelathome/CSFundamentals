//
//  LGAlertButton.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/21.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "LGAlertButton.h"

@implementation LGAlertButton

- (instancetype)initWitTitle:(NSString *)title block:(ClickBlock)block {
    if (self = [super init]) {
        _title = title;
        _clickBlock = [block copy];
    }
    return self;
}

@end
