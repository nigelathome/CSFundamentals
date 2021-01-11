//
//  MyTableViewCell.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2021/1/11.
//  Copyright © 2021 Hui,Li. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    for (NSUInteger i=1; i<=8; i++) {
        UIView *v = [[UIView alloc] initWithFrame:CGRectMake(i, 0, 10, 10)];
        v.backgroundColor = [UIColor cyanColor];
////        [v setOpaque:YES];//color blend layer模式下红色标识混合页面 绿色是不混合 应该减少混合页面 使用不透明的设置
        v.alpha = 0.6;
        [self.contentView addSubview:v];
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(35*i, 10, 30, 30)];
        btn.backgroundColor = [UIColor blueColor];
        btn.layer.cornerRadius = 10;
        [self.contentView addSubview:btn];
        
        //触发离屏渲染：button设置图片并且设置遮罩会触发离屏渲染 off-screen render模式下黄色表示离屏渲染
        [btn setImage:[UIImage imageNamed:@"粒子.png"] forState:UIControlStateNormal];
        btn.layer.masksToBounds = YES;
//        btn.layer.shouldRasterize = YES;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
