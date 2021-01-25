//
//  LGPlayer.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2021/1/25.
//  Copyright © 2021 Hui,Li. All rights reserved.
//

#import "LGPlayer.h"
static __strong LGPlayer *_player = nil;

@interface LGPlayer ()

@end

@implementation LGPlayer

+ (instancetype)sharedInstance {
    //单例：只有一个实例变量并且常驻内存
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _player = [[LGPlayer alloc] init];
    });
    return _player;
}

@end
