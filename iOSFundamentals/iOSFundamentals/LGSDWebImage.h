//
//  LGSDWebImage.h
//  iOSFundamentals
//
//  Created by Hui,Li on 2021/1/25.
//  Copyright © 2021 Hui,Li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class LGSDWebImageDownloader;

@protocol LGSDWebImageDownloaderDelegate <NSObject>

- (void)sdWebImageDownloader:(LGSDWebImageDownloader *)downloadOperation didFinishedWithImage:(UIImage *)image;

@end

@interface LGSDWebImageDownloader : NSOperation

@property (nonatomic, copy) NSString *url;
@property (nonatomic, weak) id<LGSDWebImageDownloaderDelegate> delegate;
@property (nonatomic, assign) NSInteger index;

@end

NS_ASSUME_NONNULL_END
