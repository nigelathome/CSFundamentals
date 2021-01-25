//
//  ImageDownloadViewController.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2021/1/25.
//  Copyright © 2021 Hui,Li. All rights reserved.
//

#import "ImageDownloadViewController.h"
#import "LGSDWebImage.h"

@interface ImageDownloadViewController () <LGSDWebImageDownloaderDelegate>

@property (nonatomic, strong) UIImageView *v1;
@property (nonatomic, strong) UIImageView *v2;

//key:url  value:image
@property (nonatomic, strong) NSCache *images;//缓存图片
//key:url  value:operation
@property (nonatomic, strong) NSCache *operations;//缓存下载任务
//下载队列 存放LGSDWebImageDownloader
@property (nonatomic, strong) NSOperationQueue *queue;

@end

@implementation ImageDownloadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"多线程应用——图片下载";
    
    self.v1.frame = CGRectMake(50, 100, 100, 100);
    self.v1.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:self.v1];
    
    self.v2.frame = CGRectMake(50, 250, 100, 100);
    self.v2.backgroundColor = [UIColor magentaColor];
    [self.view addSubview:self.v2];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self downloadImageWithURL:@"http://imagev2.xmcdn.com/group59/M07/B8/EB/wKgLeFzdHaGykUG_ABKaeOujlxk807.jpg!op_type=5&upload_type=album&device_type=ios&name=medium&magick=png" index:1];
    [self downloadImageWithURL:@"http://imagev2.xmcdn.com/group60/M03/B6/91/wKgLb1zPwYeCDAH5AAT7VdyCAvE857.png!op_type=3&columns=290&rows=290&magick=png" index:2];
}

#pragma mark - lazy load
- (UIImageView *)v1 {
    if (!_v1) {
        _v1 = [[UIImageView alloc] init];
    }
    return _v1;
}

- (UIImageView *)v2 {
    if (!_v2) {
        _v2 = [[UIImageView alloc] init];
    }
    return _v2;
}

- (NSCache *)images {
    if (!_images) {
        _images = [[NSCache alloc] init];
        //缓存数量
        _images.countLimit = 100;
        //缓存大小 10M
        _images.totalCostLimit = 10 * 1024 * 1024;
    }
    return _images;
}

- (NSCache *)operations {
    if (!_operations) {
        _operations = [[NSCache alloc] init];
        //缓存数量
        _operations.countLimit = 100;
        //缓存大小 10M
        _operations.totalCostLimit = 10 * 1024 * 1024;
    }
    return _operations;
}

- (NSOperationQueue *)queue {
    if (!_queue) {
        _queue = [[NSOperationQueue alloc] init];
    }
    return _queue;
}

#pragma mark - 下载图片
- (void)downloadImageWithURL:(NSString *)url index:(NSInteger)index {
    UIImage *image = [self.images objectForKey:url];
    if (image) {//已经缓存则直接使用
        if (index == 1) {
            self.v1.image = image;
        } else {
            self.v2.image = image;
        }
    } else {
        LGSDWebImageDownloader *operation = [self.operations objectForKey:url];
        if (!operation) {//任务不在缓存中则创建和初始化
            operation = [[LGSDWebImageDownloader alloc] init];
            operation.delegate = self;
            operation.url = url;
            operation.index = index;
            [self.operations setObject:operation forKey:url];
            [self.queue addOperation:operation];//异步执行下载任务
        }
    }
}

#pragma mark - LGSDWebImageDownloaderDelegate
- (void)sdWebImageDownloader:(LGSDWebImageDownloader *)downloadOperation didFinishedWithImage:(UIImage *)image {
    //移除下载完的任务缓存
    if ([self.operations objectForKey:downloadOperation.url]) {
        [self.operations removeObjectForKey:downloadOperation.url];
    }
    
    if (image) {
        [self.images setObject:image forKey:downloadOperation.url];//缓存图片
        //展示图片
        if (downloadOperation.index == 1) {
            self.v1.image = image;
        } else {
            self.v2.image = image;
        }
    }
    
}

@end
