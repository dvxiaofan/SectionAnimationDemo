//
//  YKMainViewController.m
//  SectionAnimationDemo
//
//  Created by xiaofan on 16/6/10.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "YKMainViewController.h"
#import "YKSectionModel.h"
#import "YKCellModel.h"
#import "YKHeaderView.h"


static NSString *kCellIdentifier = @"UITableViewCell";
static NSString *kHeaderViewIdentifier = @"YKHeaderView";

@interface YKMainViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *sectionDataSources;

@end

@implementation YKMainViewController

- (NSMutableArray *)sectionDataSources {
    if (!_sectionDataSources) {
        _sectionDataSources = [[NSMutableArray alloc] init];
        
        // 创建 section
        for (NSUInteger i = 0; i < 20; i++) {
            YKSectionModel *sectionModel = [[YKSectionModel alloc] init];
            sectionModel.isExpanded = NO;
            sectionModel.sectionTitle = [NSString stringWithFormat:@"section：%ld", i + 1];
            
            // 创建 section 中的 cell
            NSMutableArray *itemArray = [[NSMutableArray alloc] init];
            for (NSUInteger j = 0; j < 10; j++) {
                YKCellModel *cellModel = [[YKCellModel alloc] init];
                cellModel.title = [NSString stringWithFormat:@"xiaofan：section = %ld, row = %ld", i + 1, j + 1];
                [itemArray addObject:cellModel];
            }
            sectionModel.cellModels = itemArray;
            
            [_sectionDataSources addObject:sectionModel];
        }
    }
    return _sectionDataSources;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"dvxiaofan.com";
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    [tableView registerClass:[YKHeaderView class] forHeaderFooterViewReuseIdentifier:kHeaderViewIdentifier];
}

#pragma mark - UITableViewDataSource 

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionDataSources.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    YKSectionModel *sectionModel = self.sectionDataSources[section];
    
    return sectionModel.isExpanded ? sectionModel.cellModels.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    YKSectionModel *sectionModel = self.sectionDataSources[indexPath.section];
    YKCellModel *cellModel = sectionModel.cellModels[indexPath.row];
    cell.textLabel.text = cellModel.title;
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    YKHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kHeaderViewIdentifier];
    
    YKSectionModel *sectionModel = self.sectionDataSources[section];
    headerView.model = sectionModel;
    headerView.expandCallBack = ^(BOOL isExpanded) {
        [tableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationFade];
    };
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
