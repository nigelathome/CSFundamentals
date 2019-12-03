//
//  TreeNode.h
//  CSFundamentals
//
//  Created by Hui,Li on 2019/12/3.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TreeNode : NSObject

//左右子树
@property (nonatomic, nullable) TreeNode *left;
@property (nonatomic, nullable) TreeNode *right;
//结点值
@property (nonatomic, assign) NSInteger val;

- (instancetype)initWithValue:(NSInteger)val;

@end

NS_ASSUME_NONNULL_END
