//
//  ZZQHomeViewController.m
//  FItBodyMerchant
//
//  Created by ben on 17/3/30.
//  Copyright © 2017年 张增强. All rights reserved.
//

#import "ZZQHomeViewController.h"
#import "ZZQMenus.h"
#import "ZZQAddNewMenuViewController.h"
#import "ZZQHomeTableViewCell.h"

#define CELL_ID @"CELL_ID"
#define LIMIT 10
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
@property(nonatomic, strong)NSMutableArray<ZZQMenus *> * menusArray;
@property(nonatomic, assign)NSUInteger limitNum;
//cell
@property(nonatomic, strong)ZZQHomeTableViewCell * cell;

@end

@implementation ZZQHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的菜单";
    self.view.backgroundColor = [UIColor redColor];
    _menusArray = [NSMutableArray array];
    [self initNav];
//    [self initForData];
    [self initTableView];
    [self refresh];
}

#pragma mark
#pragma mark =========== 设置nav
- (void)initNav{
    _addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_addBtn setImage:[UIImage imageNamed:@"nav_add"] forState:UIControlStateNormal];
    [_addBtn setFrame:CGRectMake(0, 0, 25, 25)];
    [_addBtn addTarget:self action:@selector(addNewMenuAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _addItem = [[UIBarButtonItem alloc] initWithCustomView:_addBtn];
    self.navigationItem.rightBarButtonItem = _addItem;
}

- (void)addNewMenuAction:(UIButton *)btn{
    ZZQAddNewMenuViewController * addNewMenuVC = [[ZZQAddNewMenuViewController alloc] init];
    [self.navigationController pushViewController:addNewMenuVC animated:YES];
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
    }];
    
    _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self initForNewData];
    }];
    
    [_tableView.mj_header beginRefreshing];
}

#pragma mark
#pragma mark ============ 初始化数据(初次加载)
- (void)initForData{
    _menusArray = [NSMutableArray array];
    _limitNum = LIMIT;
    __weak typeof(self)myself = self;
    AVQuery * query = [AVQuery queryWithClassName:@"Menus"];
    [query whereKey:@"owner" equalTo:[AVUser currentUser]];
    query.limit = _limitNum;
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if (!error) {
            for (AVObject * obj in objects) {
                myself.menu = [[ZZQMenus alloc] init];
                myself.menu = [myself.menu getMenuWithObject:obj];
                [myself.menusArray addObject:myself.menu];
            }
        }
        [myself.tableView.mj_header endRefreshing];
        [myself.tableView reloadData];
        myself.limitNum += LIMIT;
    }];
}

//下拉加载
- (void)initForNewData{
    _menusArray = [NSMutableArray array];
    AVQuery * query = [AVQuery queryWithClassName:@"Menus"];
    [query whereKey:@"owner" equalTo:[AVUser currentUser]];
    query.limit = _limitNum;
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if (!error) {
            for (AVObject * obj in objects) {
                _menu = [[ZZQMenus alloc] init];
                _menu = [_menu getMenuWithObject:obj];
                [_menusArray addObject:_menu];
            }
        }
        [_tableView.mj_footer endRefreshing];
        [_tableView reloadData];
        _limitNum += LIMIT;
    }];
}

#pragma mark
#pragma mark =========== 代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _menusArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    _cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID];
    if (_cell == nil) {
        _cell = [[ZZQHomeTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CELL_ID];
    }
    [_cell setCellModel:_menusArray[indexPath.section] index:indexPath];
    return _cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView clearSelectedRowsAnimated:YES];
    ZZQAddNewMenuViewController * newMenuVC = [[ZZQAddNewMenuViewController alloc] init];
    [newMenuVC setMenuModle:_menusArray[indexPath.section]];
    [self.navigationController pushViewController:newMenuVC animated:YES];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (_tableView != nil) {
        [_tableView.mj_header beginRefreshing];
    }
    [self initForData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
