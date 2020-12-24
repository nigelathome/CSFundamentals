//
//  NSObject+LGKVO.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/24.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "NSObject+LGKVO.h"

@implementation NSObject (LGKVO)

static const char *key = "objc";

- (void)LG_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context {
    //1.持久化观察者
    objc_setAssociatedObject(self, key, observer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    //2.生成子类LGKVO_Person 并把对象的isa指向这个子类
    NSString *oldClassName = NSStringFromClass([self class]);
    NSString *newClassName = [NSString stringWithFormat:@"LGKVO_%@", oldClassName];
    Class myClass = objc_allocateClassPair(self.class, [newClassName UTF8String], 0);//动态创建类 需要指定父类及新创建的类名
    class_addMethod(myClass, @selector(setAge:), (IMP)setAgeIMP, "v@:i");
    objc_registerClassPair(myClass);//注册新建的子类
    object_setClass(self, myClass);//self->isa = 子类
}

- (void)setAge:(NSInteger)age {
    
}

void setAgeIMP(id self, SEL _cmd, int age) {
    //3.重写setter方法
    Class subCls = [self class];//保存当前对象的子类地址
    //调用父类的setter方法 先把isa->父类
    object_setClass(self, class_getSuperclass([self superclass]));
    //调用父类的setter方法
    void *(*action)(id, SEL, int) = (void * (*)(id, SEL, int))objc_msgSend;//objc_msgSend不支持传参需要新建函数指针进行操作
    action(self, @selector(setAge:), age);
    
    //4.通知观察者 调用回调方法
    id observer = objc_getAssociatedObject(self, key);//取出先前持久化的观察者
    void *(*callBack)(id, SEL, id, id, id, id) = (void * (*)(id, SEL, id, id, id, id))objc_msgSend;
    callBack(observer, @selector(observeValueForKeyPath:ofObject: change: context:), @"age", self, @{@"age": @(age)}, nil);
    
    //5.恢复isa->子类 监听下一次
    object_setClass(self, subCls);
}

@end
