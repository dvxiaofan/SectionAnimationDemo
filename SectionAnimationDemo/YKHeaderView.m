//
//  YKHeaderView.m
//  SectionAnimationDemo
//
//  Created by xiaofan on 16/6/10.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "YKHeaderView.h"
#import "YKSectionModel.h"


@interface YKHeaderView ()

@property (nonatomic, strong) UIImageView *arrowImageView;  // 翻转剪头视图
@property (nonatomic, strong) UILabel *titleLabel;          // headerview 标题

@end

@implementation YKHeaderView


- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        
        UIImageView *arrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"brand_expand"]];
        arrowImageView.frame = CGRectMake(10, (44 - 8) / 2, 15, 8);
        [self.contentView addSubview:arrowImageView];
        self.arrowImageView = arrowImageView;
        
        // headerVeiw 底部一个 button
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, width, 44);
        [button addTarget:self action:@selector(onExpand:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:button];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(35, 0, 200, 44)];
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:titleLabel];
        self.titleLabel = titleLabel;
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 44 - 0.5, width, 0.5)];
        line.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:line];
    }
    return self;
}

- (void)setModel:(YKSectionModel *)model {
    if (_model != model) {
        _model = model;
    }
    
    if (model.isExpanded) {
        self.arrowImageView.transform = CGAffineTransformIdentity;
    } else {
        self.arrowImageView.transform = CGAffineTransformMakeRotation(M_PI);
    }
    
    self.titleLabel.text = model.sectionTitle;
}

- (void)onExpand:(UIButton *)sender {
    self.model.isExpanded = !self.model.isExpanded;
    
    [UIView animateWithDuration:0.25 animations:^{
        if (self.model.isExpanded) {
            self.arrowImageView.transform = CGAffineTransformIdentity;
        } else {
            self.arrowImageView.transform = CGAffineTransformMakeRotation(M_PI);
        }
    }];
    
    if (self.expandCallBack) {
        self.expandCallBack(self.model.isExpanded);
    }
}



@end



















