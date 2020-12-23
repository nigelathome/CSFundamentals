//
//  UITableViewCell+IndexPath.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/23.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "UITableViewCell+IndexPath.h"

@implementation UITableViewCell (IndexPath)

static const char *key;

- (NSIndexPath *)indexPath {
    id obj = (NSIndexPath *)objc_getAssociatedObject(self, key);
    return obj;
}

- (void)setIndexPath:(NSIndexPath *)indexPath {
    objc_setAssociatedObject(self, key, indexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
