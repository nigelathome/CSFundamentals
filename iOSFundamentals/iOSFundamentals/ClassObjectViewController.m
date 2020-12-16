//
//  ClassObjectViewController.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/11/25.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "ClassObjectViewController.h"
#import "LGPerson.h"

@interface ClassObjectViewController ()

@end

@implementation ClassObjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"类和对象";
    LGPerson *p1 = [LGPerson alloc];
//    p1.name = @"Cocoi";
    p1.age = 18;
    p1.height = 185;
    p1.hobby = @"女";
    LGNSLog(@"%@", p1);
//    LGPerson *p2 = [p1 init];
//    LGPerson *p3 = [p1 init];
//    LGNSLog(@"%@ - %p", p1, &p1);
//    LGNSLog(@"%@ - %p", p2, &p2);
//    LGNSLog(@"%@ - %p", p3, &p3);
    
    //+ class 返回调用类本身 - class返回这个对象isa指向的类
    //+ memberOfClass 比较类的isa指向的类和传入的类是否相等 - memberOfClass 比较对象isa指向的类和传入的类是否相等
    //+ kindOfClass 比较调用者的isa指向的类和传入的类是否相等 不相等沿着superclass继续查找 -kindOfClass 调用者的isa指向的类和传入的类是否相等 不相等则沿着superclass查找
    BOOL r1 = [[NSObject class] isKindOfClass:[NSObject class]];//NSObject元类和NSObject根类是否相等，一开始不相等 然后NSObject元类沿着superclass再比较 NSObject元类的父类指向NSObject根类 所以相等
    BOOL r2 = [[NSObject class] isMemberOfClass:[NSObject class]];//NSObject元类和NSObject根类是否相等
    BOOL r3 = [[LGPerson class] isKindOfClass:[LGPerson class]];//LGPerson元类和LGPerson根类是否相等 不相等沿着LGPerson元类的superclass继续查找 最后会找到NSObject元类->NSObject根类 和LGPerson根类不相等
    BOOL r4 = [[LGPerson class] isMemberOfClass:[LGPerson class]];//LGPerson元类和LGPerson根类是不相等
    BOOL r5 = [p1 isKindOfClass:[p1 class]];//LGPerson根类和LGPerson根类是相等
    LGNSLog(@"%d %d %d %d %d", r1, r2, r3, r4, r5);
    
//    LGPerson *pe = [[LGPerson alloc] init];
////    pe->isa = [LGPerson class];
//    [pe print];
    UIViewController *vc = [[UIViewController alloc] init];
    id cls = [LGPerson class];
    void *ob = &cls;
    [(__bridge id)ob print];
    
    LGPerson *pe = [[LGPerson alloc] init];
    [pe func];
    
    Class pe_class = [pe class];//pe的类对象
    Class pe_meta = object_getClass(pe_class);//pe的元类
    Class pe_meta_isa = object_getClass(pe_meta);//pe元类的isa指向
    NSObject *obj= [[NSObject alloc] init];//NSObject实例对象
    Class obj_class = [obj class];//NSObject类对象
    Class obj_meta = object_getClass(obj_class);//NSObject元类
    Class obj_meta_isa = object_getClass(obj_meta);//NSObject元类isa
    LGNSLog(@"类对象%p 元类%p 元类isa指向%p", pe_class, pe_meta, pe_meta_isa);
    LGNSLog(@"类对象%p 元类%p 元类isa指向%p", obj_class, obj_meta, pe_meta_isa);
    LGNSLog(@"元类的isa指向 %p %p", pe_meta_isa, obj_meta_isa);
    Class obj_meta_superclass = class_getSuperclass(obj_meta_isa);//NSObject元类的superclass
    LGNSLog(@"元类的superclass指向 %p", obj_meta_superclass);
    
    //获取实例对象的成员变量
    Class pClass = [pe class];
    unsigned int outCount = 0;
    Ivar *vars = class_copyIvarList(pClass, &outCount);//成员变量列表
    for (NSInteger i=0; i<outCount; i++) {
        //打印成员变量相关的信息 name、type、相对类初始地址的偏移量
        Ivar ivar = vars[i];
        const char *name = ivar_getName(ivar);
        const char *type = ivar_getTypeEncoding(ivar);
        ptrdiff_t diff = ivar_getOffset(ivar);
        LGNSLog(@"name:%s, type:%s, offset:%ld", name, type, diff);
    }
    free(vars);
    
    //获取实例对象的属性
    Class peCls = [pe class];
    unsigned int poutCount = 0;
    objc_property_t *prop = class_copyPropertyList(peCls, &poutCount);//属性列表
    for(NSInteger i=0; i<poutCount; i++) {
        //打印属性相关的信息 name、attribute
        objc_property_t property = prop[i];
        const char *name = property_getName(property);
        const char *attri = property_getAttributes(property);
        LGNSLog(@"name:%s, attri:%s", name, attri);
        //打印属性的特性的详细信息
        unsigned int attriCount = 0;
        objc_property_attribute_t *atts = property_copyAttributeList(property, &attriCount);
        for(NSInteger i=0; i<attriCount; i++) {
            objc_property_attribute_t attribute = atts[i];
            const char *attName = attribute.name;
            const char *attValue = attribute.value;
            LGNSLog(@"attName:%s, attValue:%s", attName, attValue);
        }
        LGNSLog(@"");
        free(atts);
    }
    free(prop);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
