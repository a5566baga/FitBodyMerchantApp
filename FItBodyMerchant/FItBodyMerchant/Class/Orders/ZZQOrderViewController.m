//
//  ZZQOrderViewController.m
//  FItBodyMerchant
//
//  Created by ben on 17/3/30.
//  Copyright © 2017年 张增强. All rights reserved.
//

#import "ZZQOrderViewController.h"
#import "ZZQOrders.h"

@interface ZZQOrderViewController ()

//segment
@property(nonatomic, strong)UISegmentedControl * segment;
//scrollView
@property(nonatomic, strong)UIScrollView * scrollView;
//第一个tableview
@property(nonatomic, strong)UITableView * oneTableView;
//第二个tableview
@property(nonatomic, strong)UITableView * twoTableView;
//第一个页面数据
@property(nonatomic, strong)ZZQOrders * order;
@property(nonatomic, strong)NSMutableArray<ZZQOrders *> * oneDataList;
//第二个页面数据
@property(nonatomic, strong)NSMutableArray<ZZQOrders *> * twoDataList;
//

@end

@implementation ZZQOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"订单处理";
    [self initForSegment];
    [self initForScrollView];
    [self initForOneData];
    [self initForOneTableView];
    
    [self initForTwoData];
    [self initForTwoTableView];
}

#pragma mark
#pragma mark ========== 设置segment
- (void)initForSegment{
    self.automaticallyAdjustsScrollViewInsets = NO;
    _segment = [[UISegmentedControl alloc] initWithItems:@[@"订单", @"已接单", @"已完成"]];
    _segment.frame = CGRectMake(0, 0, SCREEN_WIDTH, 35);
    [_segment addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    _segment.selectedSegmentIndex = 0;
    [self.view addSubview:_segment];
}
- (void)segmentAction:(UISegmentedControl *)setment{
    
}
#pragma mark
#pragma mark ========== 设置scrollView
- (void)initForScrollView{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_segment.frame), SCREEN_WIDTH, SCREEN_HEIGHT-CGRectGetMaxY(_segment.frame)-49)];
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH*3, _scrollView.height);
    _scrollView.backgroundColor = [UIColor blueColor];
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    [self.view addSubview:_scrollView];
}

#pragma mark
#pragma mark ========== 设置第一个tableview
- (void)initForOneTableView{
    
}

#pragma mark
#pragma mark ========== 设置第二个tableview
- (void)initForTwoTableView{
    
}

#pragma mark
#pragma mark ========== 请求第一个数据
- (void)initForOneData{
    
}

#pragma mark
#pragma mark ========== 请求第二个数据
- (void)initForTwoData{
    
}

#pragma mark
#pragma mark ========== 代理

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
