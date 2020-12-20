//
//  RuntimeViewController.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/4.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "RuntimeViewController.h"
#import "NSMutableArray+SafeMutableArray.h"
#import "LGFather.h"
#import "LGCat.h"
#import "LGDog.h"
#import "LGPig.h"

@interface RuntimeViewController ()

@end

@implementation RuntimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"runtime测试";
    [self exchangeIMP];
    [self printA];
    [self printB];
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    [arr addObject:@"1"];
    [arr addObject:@"2"];
    [arr addObject:@"3"];
    id obj = [arr objectAtIndex:3];
    LGNSLog(@"obj: %@", obj);
    
    //通过@selector创建的的SEL和通过字符串创建的SEL 名字相同则地址相同
    SEL sel = @selector(run);
    LGNSLog(@"sel address: %p", sel);
    
    const char *methodName = [@"run" UTF8String];
    SEL selFromString = sel_registerName(methodName);
    LGNSLog(@"selFromString address: %p", selFromString);
    
    //动态添加成员变量
    BOOL isSucc = class_addIvar([LGFather class], "_name", sizeof(NSString *), log2(sizeof(NSString *)), @encode(NSString *));
    if (isSucc) {
        LGNSLog(@"add _name success");
    } else {
        LGNSLog(@"add _name failed");
    }
    
    //动态添加属性
    objc_property_attribute_t attribute1 = {"T", "@\"NSString\""};//属性类型
    objc_property_attribute_t attribute2 = {"C", "@\"NSString\""};//属性copy
    objc_property_attribute_t attribute3 = {"N", "@\"NSString\""};//属性原子性
    objc_property_attribute_t attribute4 = {"V", "_name"};//属性成员变量
    objc_property_attribute_t attribute[] = {attribute1, attribute2, attribute3, attribute4};
    unsigned int attributeCount = 4;
    BOOL isSuccAddPro = class_addProperty([LGFather class], "name", attribute, attributeCount);
    if (isSuccAddPro) {
        LGNSLog(@"add property name success");
    } else {
        LGNSLog(@"add property name failed");
    }
//    LGFather *father = [LGFather new];
//    [father setValue:@"Jack" forKey:@"name"];
//    NSString *result = [father valueForKey:@"name"];
//    LGNSLog(@"name value:%@", result);
    
    //消息转发阶段1
    LGCat *cat = [LGCat new];
    [cat performSelector:@selector(jump)];
    
    //消息转发阶段2
    LGDog *dog = [LGDog new];
    [dog performSelector:@selector(jump)];
    
    //消息转发阶段3
    LGPig *pig = [LGPig new];
    [pig performSelector:@selector(jump)];
    
    //动态添加类和方法
    [self dynamicAddClass];
    
    //热修复崩溃
//    [self hotPatch];
}

- (void)printA {
    LGNSLog(@"打印A......");
}

- (void)printB {
    LGNSLog(@"打印B......");
}

- (void)exchangeIMP {
    //交换方法的实现，并测试打印
    Method methodA = class_getInstanceMethod([self class], @selector(printA));
    Method methodB = class_getInstanceMethod([self class], @selector(printB));
    method_exchangeImplementations(methodA, methodB);
}

- (void)dynamicAddClass {
    //动态添加Teacher类 成员变量 并注册
    Class Teacher = objc_allocateClassPair([NSObject class], "Teacher", 0);
    BOOL isSucc = class_addIvar(Teacher, "_name", sizeof(NSString *), log2(sizeof(NSString *)), @encode(NSString *));
    if (isSucc) {
        LGNSLog(@"add ivar success");
        class_addMethod(Teacher, @selector(method:), (IMP)methodIMP, "v@:");
        objc_registerClassPair(Teacher);
        
        //使用动态创建的类
        id te = [[Teacher alloc] init];
        [te setValue:@"nigel li" forKey:@"_name"];
        [te method:120];
    } else {
        LGNSLog(@"add ivar failed");
    }
}

- (void)method:(NSInteger)other {
    //selector只是一个符号 实现是在定义的IMP
}

void methodIMP(id self, SEL _cmd, int other) {
    Ivar ivar = class_getInstanceVariable([self class], "_name");
    id value = object_getIvar(self, ivar);
    LGNSLog(@"%@", value);
    LGNSLog(@"%d", other);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //点击屏幕任意位置crash
    [self setupFirstName:@"Jack" lastName:@"Rose"];
}

- (void)setupFirstName:(NSString *)firstName lastName:(NSString *)lastName {
    NSMutableArray *arr = [NSMutableArray array];
    id result = arr[1];
    LGNSLog(@"%@", result);
}

- (void)hotPatch {
    //热修复崩溃
    unsigned int outCount = 0;
    Method _Nonnull *methods = class_copyMethodList([self class], &outCount);
    for (int i=0; i<outCount; i++) {
        Method m = methods[i];
        SEL sel = method_getName(m);
        if ([NSStringFromSelector(sel) isEqualToString:@"setupFirstName:lastName:"]) {
            //拿到奔溃的方法做替换
            class_replaceMethod([self class], sel, (IMP)patchMethod, "v@:");
            break;
        }
    }
}

void patchMethod(id self, SEL _cmd, const char *other) {
    LGNSLog(@"fixed crash %@ %@", self, NSStringFromSelector(_cmd));
}

@end
