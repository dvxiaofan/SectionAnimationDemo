//
//  YKHeaderView.h
//  SectionAnimationDemo
//
//  Created by xiaofan on 16/6/10.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import <UIKit/UIKit.h>


@class YKSectionModel;

// 因为展开与收起，我们添加了一个简单的动画，所以外部需要回调，我们给一个回调的闭包
typedef void(^YKHeaderViewExpandCallBack)(BOOL isExpanded);

@interface YKHeaderView : UITableViewHeaderFooterView

@property (nonatomic, strong) YKSectionModel *model;
@property (nonatomic, copy) YKHeaderViewExpandCallBack expandCallBack;


@end
