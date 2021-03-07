//
//  ProtocolCategoryBlockViewController.h
//  iOSFundamentals
//
//  Created by Hui,Li on 2021/3/7.
//  Copyright © 2021 Hui,Li. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NSInteger (^BiggerBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface ProtocolCategoryBlockViewController : UIViewController

@property (nonatomic, copy) BiggerBlock biggerBlock;

@end

NS_ASSUME_NONNULL_END
