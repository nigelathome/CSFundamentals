//
//  BlockViewController.h
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/11/18.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^MyBlock) (void);
typedef NSInteger (^GetSum) (NSInteger, NSInteger);
typedef void (^ShowSumBlock) (NSInteger, NSInteger);

NS_ASSUME_NONNULL_BEGIN

@interface BlockViewController : UIViewController

@property (nonatomic, copy) MyBlock myBlock;
@property (nonatomic, copy) NSString *name;

@end

NS_ASSUME_NONNULL_END
