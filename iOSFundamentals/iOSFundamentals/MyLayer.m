//
//  MyLayer.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2021/1/7.
//  Copyright © 2021 Hui,Li. All rights reserved.
//

#import "MyLayer.h"

@implementation MyLayer

- (id<CAAction>)actionForKey:(NSString *)event {
    LGNSLog(@"MyLayer action: %@", event);
    return [super actionForKey:event];
}

@end
