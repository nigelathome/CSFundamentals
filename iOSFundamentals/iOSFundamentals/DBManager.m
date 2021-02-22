//
//  DBManager.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2021/2/22.
//  Copyright © 2021 Hui,Li. All rights reserved.
//

#import "DBManager.h"
#import "Framework/FMDB.framework/Headers/FMDB.h"

@interface DBManager ()

@property (nonatomic, strong) FMDatabase *db;

@end

@implementation DBManager

singleton_m(DBManager)

- (void)createDB {
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"model.sqlite"];
    self.db = [FMDatabase databaseWithPath:filePath];//创建数据库
    if ([self.db open]) {
        LGNSLog(@"YES");
    } else {
        LGNSLog(@"NO");
    }
}

- (void)createTable {
    if ([self.db open]) {
        NSString *createTableSQL = @"create table Employee(epl_id Integer primary key autoincrement not null, name varchar(255), age integer);";
        BOOL result = [self.db executeUpdate:createTableSQL];
        if (result) {
            LGNSLog(@"create table success");
        } else {
            LGNSLog(@"create table fail");
        }
    }
}

- (void)insertEmployee:(LGEmployee *)employee {
    if ([self.db open]) {
        BOOL result = [self.db executeUpdate:@"insert into Employee(name, age) values(?, ?);", employee.name, @(employee.age)];
        if (result) {
            LGNSLog(@"insert row success");
        } else {
            LGNSLog(@"insert row fail");
        }
    }
}

- (void)deleteEmployee:(LGEmployee *)employee {
    if ([self.db open]) {
        BOOL result = [self.db executeUpdate:@"delete from Employee where epl_id = ?;", @(employee.epl_id)];
        if (result) {
            LGNSLog(@"delete row success");
        } else {
            LGNSLog(@"delete row fail");
        }
    }
}

- (void)updateEmployee:(LGEmployee *)employee {
    if ([self.db open]) {
        BOOL result = [self.db executeUpdate:@"update Employee set name = ? where epl_id = ?;", employee.name, @(employee.epl_id)];
        if (result) {
            LGNSLog(@"update row success");
        } else {
            LGNSLog(@"update row fail");
        }
    }
}

- (NSArray *)allEmployees {
    NSMutableArray *employeeArray = [NSMutableArray array];
    if ([self.db open]) {
        FMResultSet *set = [self.db executeQuery:@"select * from Employee"];
        while ([set next]) {
            LGEmployee *employee = [LGEmployee new];
            employee.name = [set stringForColumn:@"name"];
            employee.age = [[set stringForColumn:@"age"] integerValue];
            [employeeArray addObject:employee];
        }
    }
    return employeeArray;
}

@end
