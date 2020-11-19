//
//  BlockViewController.h
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/11/18.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^MyBlock) (void);

NS_ASSUME_NONNULL_BEGIN

@interface BlockViewController : UIViewController

@property (nonatomic, weak) MyBlock myBlock;
@property (nonatomic, copy) NSString *name;

@end

NS_ASSUME_NONNULL_END
