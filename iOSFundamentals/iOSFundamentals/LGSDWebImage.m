//
//  LGSDWebImage.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2021/1/25.
//  Copyright © 2021 Hui,Li. All rights reserved.
//

#import "LGSDWebImage.h"

@implementation LGSDWebImageDownloader

- (void)main {
    // 下载是异步操作中进行的 需要脱离主线程所在的线程池
    @autoreleasepool {
        //如果线程被取消 则不继续进行
        if (self.cancelled) {
            return;
        }
        
        //通过url获取图片
        NSURL *url = [NSURL URLWithString:self.url];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(sdWebImageDownloader:didFinishedWithImage:)]) {
            //回到主线程拿取图片
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.delegate sdWebImageDownloader:self didFinishedWithImage:image];
            });
        }
    }
}

@end
