//
//  UIAlertView+Block.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/21.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "UIAlertView+Block.h"
#import "LGAlertButton.h"

@implementation UIAlertView (Block)

static const void *key;

- (instancetype)initWithTitle:(nullable NSString *)title message:(nullable NSString *)message cancelButton:(nullable LGAlertButton *)cancelButton otherButton:(nullable LGAlertButton *)otherButton {
    if (self = [self initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButton.title otherButtonTitles:otherButton.title, nil]) {
        NSMutableArray *items = [self btnItems];
//        NSMutableArray *items = [NSMutableArray array];
        if (otherButton) {
            [items addObject:otherButton];
        }
        
        //...语法处理 处理其他btn
//        LGAlertButton *eachItem;
//        va_list args;
//        va_start(args, otherButton);
//        while ((eachItem = va_arg(args, LGAlertButton *))) {
//            [items addObject:eachItem];
//        }
//        va_end(args);
                
        if (cancelButton) {
            [items insertObject:cancelButton atIndex:0];
        }
        
        //关联所有的按钮
        objc_setAssociatedObject(self, key, items, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        self.delegate = self;
    }
    return self;
}

- (NSMutableArray *)btnItems {
    NSMutableArray *items =  (NSMutableArray*)objc_getAssociatedObject(self, key);
    if (!items) {
        items = [NSMutableArray array];
        objc_setAssociatedObject(self, key, items, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return items;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSMutableArray *items =  (NSMutableArray*)objc_getAssociatedObject(self, key);
    if (items) {
        LGAlertButton *btn = [items objectAtIndex:buttonIndex];
        if(btn.clickBlock) {
            btn.clickBlock();
        }
    }
}

@end
