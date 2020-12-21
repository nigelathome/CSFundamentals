//
//  UIAlertView+Block.h
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/21.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LGAlertButton;

NS_ASSUME_NONNULL_BEGIN

@interface UIAlertView (Block)

- (instancetype)initWithTitle:(nullable NSString *)title message:(nullable NSString *)message cancelButton:(nullable LGAlertButton *)cancelButton otherButton:(nullable LGAlertButton *)otherButton;

@end

NS_ASSUME_NONNULL_END
