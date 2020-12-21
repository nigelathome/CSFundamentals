//
//  UIButton+Block.h
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/21.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^LGHandlerBlock)(id _Nullable sender);

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Block)

- (void)handleEvent:(UIControlEvents)event withBlock:(LGHandlerBlock)handlerBlock;

@end

NS_ASSUME_NONNULL_END
