//
//  LGDownloadImageDemo.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2021/1/23.
//  Copyright © 2021 Hui,Li. All rights reserved.
//

#import "LGDownloadImageDemo.h"

typedef void(^DownloadBlock)(NSData *data);

@interface LGDownloadImageDemo ()

@property (nonatomic, strong) NSCache *cache;

@end

@implementation LGDownloadImageDemo

- (instancetype)init {
    self = [super init];
    if (self) {
        self.cache = [[NSCache alloc] init];
        //缓存数量
        self.cache.countLimit = 100;
        //缓存大小 5M
        self.cache.totalCostLimit = 5 * 1024 * 1024;
    }
    return self;
}

- (void)downloadWithURL:(NSURL *)url {
    NSData *data = [self.cache objectForKey:url];
    if (data) {
        //有缓存则使用缓存
        //TODO:使用缓存
    } else {
        //没有缓存则根据url下载图片资源并缓存
        __weak typeof(self) weakSelf = self;
        [self doDownloadTaskWithURL:url completion:^(NSData *data) {
            [weakSelf.cache setObject:data forKey:url];//把下载的图片进行缓存
        }];
    }
}

- (void)doDownloadTaskWithURL:(NSURL *)url completion:(DownloadBlock)completionHandler {
    //根据url下载图片资源 返回data
    //TODO:相关逻辑
}

@end
