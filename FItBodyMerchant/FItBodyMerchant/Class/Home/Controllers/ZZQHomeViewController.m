//
//  ZZQHomeViewController.m
//  FItBodyMerchant
//
//  Created by ben on 17/3/30.
//  Copyright © 2017年 张增强. All rights reserved.
//

#import "ZZQHomeViewController.h"
#import "ZZQMenus.h"

@interface ZZQHomeViewController ()<UITableViewDelegate, UITableViewDataSource>

//nav右侧一个添加按钮
@property(nonatomic, strong)UIButton * addBtn;
@property(nonatomic, strong)UIBarButtonItem * addItem;
//tableview显示菜品
//section显示种类
@property(nonatomic, strong)UITableView * tableView;
//菜单种类model
@property(nonatomic, strong)ZZQMenus * menu;
//菜单保存下来的数组
@property(nonatomic, strong)NSMutableArray * menusArray;

@end

@implementation ZZQHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的菜单";
    self.view.backgroundColor = [UIColor redColor];
    _menusArray = [NSMutableArray array];
    [self initNav];
    [self initForData];
    [self initTableView];
    [self refresh];
}

#pragma mark
#pragma mark =========== 设置nav
- (void)initNav{
    _addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_addBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    
}

#pragma mark
#pragma mark =========== 初始化tableview
- (void)initTableView{
    self.automaticallyAdjustsScrollViewInsets = YES;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-49) style:UITableViewStyleGrouped];
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

#pragma mark
#pragma mark =========== 刷新操作
- (void)refresh{
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self initForData];
        [_tableView reloadData];
    }];
    
    _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self initForNewData];
        [_tableView reloadData];
    }];
    
    [_tableView.mj_header beginRefreshing];
}

#pragma mark
#pragma mark ============ 初始化数据(初次加载)
- (void)initForData{
    
}

//下拉加载
- (void)initForNewData{
    
}

#pragma mark
#pragma mark =========== 代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
