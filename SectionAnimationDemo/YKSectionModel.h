//
//  YKSectionModel.h
//  SectionAnimationDemo
//
//  Created by xiaofan on 16/6/10.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YKSectionModel : NSObject

@property (nonatomic, copy) NSString *sectionTitle;

@property (nonatomic, assign) BOOL isExpanded;              // 是否展开 section
@property (nonatomic, strong) NSMutableArray *cellModels;   // section 里的多个 cell

@end
