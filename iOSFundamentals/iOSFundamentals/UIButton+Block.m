//
//  UIButton+Block.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/21.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "UIButton+Block.h"

@implementation UIButton (Block)

static const void *key;

- (void)handleEvent:(UIControlEvents)event withBlock:(LGHandlerBlock)handlerBlock {
    NSString *methodSEL = [self eventToString:event];//使用event名作为SEL
    
    NSMutableDictionary *operations = (NSMutableDictionary*)objc_getAssociatedObject(self, key);
    if(!operations) {
        operations = [NSMutableDictionary dictionary];\
        objc_setAssociatedObject(self, key, operations, OBJC_ASSOCIATION_RETAIN_NONATOMIC);//不能用copy 对可变字典copy出来是一个不可变字典 对齐写操作会崩溃
    }
    
    //key:事件 value:执行的block 保存到dict中
    [operations setValue:[handlerBlock copy] forKey:methodSEL];//block需要copy
    [self addTarget:self action:NSSelectorFromString(methodSEL) forControlEvents:event];
}

- (void)callActionBlock:(UIControlEvents)event {
    NSMutableDictionary *dict = (NSMutableDictionary *)objc_getAssociatedObject(self, key);
    if (dict) {
        NSString *eventName = [self eventToString:event];
        LGHandlerBlock block = [dict objectForKey:eventName];
        __weak typeof(self) weakSelf = self;
        if(block) {//block!=nil则执行block
            block(weakSelf);
        }
    }
}

//SEL method->event字符串
- (void)UIControlEventTouchDown {
    [self callActionBlock:UIControlEventTouchDown];
}

- (void)UIControlEventTouchDownRepeat {
    [self callActionBlock:UIControlEventTouchDownRepeat];
}

- (void)UIControlEventTouchDragInside {
    [self callActionBlock:UIControlEventTouchDragInside];
}

- (void)UIControlEventTouchDragOutside {
    [self callActionBlock:UIControlEventTouchDragOutside];
}

- (void)UIControlEventTouchDragEnter {
    [self callActionBlock:UIControlEventTouchDragEnter];
}

- (void)UIControlEventTouchDragExit {
    [self callActionBlock:UIControlEventTouchDragExit];
}

- (void)UIControlEventTouchUpInside {
    [self callActionBlock:UIControlEventTouchUpInside];
}

- (void)UIControlEventTouchUpOutside {
    [self callActionBlock:UIControlEventTouchUpOutside];
}

- (void)UIControlEventTouchCancel {
    [self callActionBlock:UIControlEventTouchCancel];
}

- (void)UIControlEventValueChanged {
    [self callActionBlock:UIControlEventValueChanged];
}

- (void)UIControlEventPrimaryActionTriggered {
    [self callActionBlock:UIControlEventPrimaryActionTriggered];
}

- (void)UIControlEventEditingDidBegin {
    [self callActionBlock:UIControlEventEditingDidBegin];
}

- (void)UIControlEventEditingChanged {
    [self callActionBlock:UIControlEventEditingChanged];
}

- (void)UIControlEventEditingDidEnd {
    [self callActionBlock:UIControlEventEditingDidEnd];
}

- (void)UIControlEventEditingDidEndOnExit {
    [self callActionBlock:UIControlEventEditingDidEndOnExit];
}

- (void)UIControlEventAllTouchEvents {
    [self callActionBlock:UIControlEventAllTouchEvents];
}

- (void)UIControlEventAllEditingEvents {
    [self callActionBlock:UIControlEventAllEditingEvents];
}

- (void)UIControlEventApplicationReserved {
    [self callActionBlock:UIControlEventApplicationReserved];
}

- (void)UIControlEventSystemReserved {
    [self callActionBlock:UIControlEventSystemReserved];
}

- (void)UIControlEventAllEvents {
    [self callActionBlock:UIControlEventAllEvents];
}

- (NSString *)eventToString:(UIControlEvents)event {
    switch (event) {
        case UIControlEventTouchDown:
            return @"UIControlEventTouchDown";
            
        case UIControlEventTouchDownRepeat:
            return @"UIControlEventTouchDownRepeat";
            
        case UIControlEventTouchDragInside:
            return @"UIControlEventTouchDragInside";
        
        case UIControlEventTouchDragOutside:
            return @"UIControlEventTouchDragOutside";
        
        case UIControlEventTouchDragEnter:
            return @"UIControlEventTouchDragEnter";
        
        case UIControlEventTouchDragExit:
            return @"UIControlEventTouchDragExit";
        
        case UIControlEventTouchUpInside:
            return @"UIControlEventTouchUpInside";
        
        case UIControlEventTouchUpOutside:
            return @"UIControlEventTouchUpOutside";
        
        case UIControlEventTouchCancel:
            return @"UIControlEventTouchCancel";
        
        case UIControlEventValueChanged:
            return @"UIControlEventValueChanged";
        
        case UIControlEventPrimaryActionTriggered:
            return @"UIControlEventPrimaryActionTriggered";
        
        case UIControlEventEditingDidBegin:
            return @"UIControlEventEditingDidBegin";
        
        case UIControlEventEditingChanged:
            return @"UIControlEventEditingChanged";
        
        case UIControlEventEditingDidEnd:
            return @"UIControlEventEditingDidEnd";
        
        case UIControlEventEditingDidEndOnExit:
            return @"UIControlEventEditingDidEndOnExit";
        
        case UIControlEventAllTouchEvents:
            return @"UIControlEventAllTouchEvents";
        
        case UIControlEventAllEditingEvents:
            return @"UIControlEventAllEditingEvents";
        
        case UIControlEventApplicationReserved:
            return @"UIControlEventApplicationReserved";
        
        case UIControlEventSystemReserved:
            return @"UIControlEventSystemReserved";
        
        case UIControlEventAllEvents:
            return @"UIControlEventAllEvents";
            
        default:
            return @"";
            break;
    }
}
    
@end
