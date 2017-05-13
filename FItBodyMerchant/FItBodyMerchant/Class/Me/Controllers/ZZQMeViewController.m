//
//  ZZQMeViewController.m
//  FItBodyMerchant
//
//  Created by ben on 17/3/30.
//  Copyright © 2017年 张增强. All rights reserved.
//

#import "ZZQMeViewController.h"
#import "ZZQMerchants.h"
#import "ZZQMeHeaderView.h"

@interface ZZQMeViewController ()<UITableViewDelegate, UITableViewDataSource>

//tableview
@property(nonatomic, strong)UITableView * tableView;
//模型
@property(nonatomic, strong)ZZQMerchants * merchant;
//数组
@property(nonatomic, strong)NSArray * titleArray;
@property(nonatomic, strong)NSArray * detailTitleArray;
//头视图
@property(nonatomic, strong)ZZQMeHeaderView * headerView;

@end

@implementation ZZQMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的设置";
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self initForData];
    [self initForTableView];
}

#pragma mark
#pragma mark ============== 设置tableview
- (void)initForTableView{
    _titleArray = @[@"店铺信息", @"意见反馈", @"关于我们"];
    _detailTitleArray = @[@"修改", @"", @""];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-49) style:UITableViewStyleGrouped];
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.showsHorizontalScrollIndicator = NO;
    _tableView.bounces = NO;
    
    _headerView = [[ZZQMeHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
    _tableView.tableHeaderView = _headerView;
    [_headerView setMerchantValue:_merchant];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

#pragma mark
#pragma mark ============== 设置数据
- (void)initForData{
    AVQuery * query = [AVQuery queryWithClassName:@"Merchants"];
    [query whereKey:@"owner" equalTo:[AVUser currentUser]];
    AVObject * obj = [query findObjects][0];
    _merchant = [[ZZQMerchants alloc] init];
    _merchant = [_merchant setMerchantDetail:obj];
}

#pragma mark
#pragma mark ============= 代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _titleArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CELL_ID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"CELL_ID"];
    }
    cell.textLabel.text = _titleArray[indexPath.section];
    cell.detailTextLabel.text = _detailTitleArray[indexPath.section];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView clearSelectedRowsAnimated:YES];
    if (indexPath.section == 0) {
        
    }
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    _headerView = [[ZZQMeHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
//    _headerView.backgroundColor = [UIColor orangeColor];
//    return _headerView;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 15;
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
