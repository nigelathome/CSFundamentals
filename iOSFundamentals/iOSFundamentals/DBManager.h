//
//  DBManager.h
//  iOSFundamentals
//
//  Created by Hui,Li on 2021/2/22.
//  Copyright © 2021 Hui,Li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "singleton.h"
#import "LGEmployee.h"

NS_ASSUME_NONNULL_BEGIN

@interface DBManager : NSObject

singleton_h(DBManager)

//创建数据库
- (void)createDB;

//成绩表
- (void)createTable;

//插入员工记录
- (void)insertEmployee:(LGEmployee *)employee;

//删除员工记录
- (void)deleteEmployee:(LGEmployee *)employee;

//修改员工记录
- (void)updateEmployee:(LGEmployee *)employee;

//获取员工
- (NSArray *)allEmployees;

@end

NS_ASSUME_NONNULL_END
