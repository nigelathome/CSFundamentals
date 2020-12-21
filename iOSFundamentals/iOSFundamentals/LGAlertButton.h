//
//  LGAlertButton.h
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/21.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ClickBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface LGAlertButton : UIButton

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) ClickBlock clickBlock;

- (instancetype)initWitTitle:(NSString *)title block:(ClickBlock)block;

@end

NS_ASSUME_NONNULL_END
