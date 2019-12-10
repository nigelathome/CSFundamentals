//
//  GraphNode.h
//  CSFundamentals
//
//  Created by Hui,Li on 2019/12/5.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//图节点 邻接表
@interface GraphNode : NSObject

@property (nonatomic, nullable) NSMutableArray<GraphNode *> *neighbors; //存储相邻的节点, 方向A->B
@property (nonatomic, assign) NSUInteger val;
@property (nonatomic, assign) BOOL isVisited; //节点是否被访问

- (instancetype)initWithValue:(NSUInteger)value;

@end

//记录课程和它的依赖课程
@interface CoursePair : NSObject

@property (nonatomic, assign) NSUInteger course;
@property (nonatomic, assign) NSUInteger dependency;

- (instancetype)initWithCourse:(NSUInteger)course dependency:(NSUInteger)dependency;

@end

@interface Course : GraphNode

@property (nonatomic, assign) NSInteger visitStatus; //-1未访问 0正在访问 1已经访问
@property (nonatomic, assign) NSInteger degree; //节点人入度

- (instancetype)initWithValue:(NSUInteger)value;

@end

NS_ASSUME_NONNULL_END
