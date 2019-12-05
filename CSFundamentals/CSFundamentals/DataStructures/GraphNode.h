//
//  GraphNode.h
//  CSFundamentals
//
//  Created by Hui,Li on 2019/12/5.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GraphNode : NSObject

@property (nonatomic, nullable) NSMutableArray<GraphNode *> *neighbors; //存储相邻的节点, 方向A->B
@property (nonatomic, assign) NSUInteger val;

- (instancetype)initWithValue:(NSUInteger)value;

@end

NS_ASSUME_NONNULL_END
