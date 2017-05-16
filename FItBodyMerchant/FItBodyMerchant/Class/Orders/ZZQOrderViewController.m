//
//  ZZQOrderViewController.m
//  FItBodyMerchant
//
//  Created by ben on 17/3/30.
//  Copyright © 2017年 张增强. All rights reserved.
//

#import "ZZQOrderViewController.h"
#import "ZZQOrders.h"
#import "ZZQMerchants.h"
#import "ZZQOrdersTableViewCell.h"
#import "ZZQRecOrdersTableViewCell.h"
#import "ZZQOrderTemp.h"

#define ONE_CELL_ID @"ONECELL"
#define TWO_CELL_ID @"TWOCELL"
#define THREE_CELL_ID @"THREECELL"
@interface ZZQOrderViewController ()<UITableViewDelegate, UITableViewDataSource>

//segment
@property(nonatomic, strong)UISegmentedControl * segment;
//scrollView
@property(nonatomic, strong)UIScrollView * scrollView;
//第一个tableview
@property(nonatomic, strong)UITableView * oneTableView;
//第二个tableview
@property(nonatomic, strong)UITableView * twoTableView;
//第一个页面数据
@property(nonatomic, strong)NSMutableArray<ZZQOrders *> * oneDataList;
//第二个页面数据
@property(nonatomic, strong)NSMutableArray<ZZQOrders *> * twoDataList;
//第一个页面cell
@property(nonatomic, strong)ZZQOrdersTableViewCell * oneCell;
//第二个页面cell
@property(nonatomic, strong)ZZQRecOrdersTableViewCell * twoCell;
//第一个页面高度
@property(nonatomic, strong)NSMutableArray<NSNumber *> * oneCellHeight;

@property(nonatomic, strong)NSTimer * timer;

@end

@implementation ZZQOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"订单处理";
    [self initForSegment];
    [self initForScrollView];
    [self initForOneData];
    [self initForOneTableView];
    
//    [self initForTwoData];
    [self initForTwoTableView];
}

#pragma mark
#pragma mark ========== 设置segment
- (void)initForSegment{
    self.automaticallyAdjustsScrollViewInsets = YES;
    _segment = [[UISegmentedControl alloc] initWithItems:@[@"订单", @"已接单", @"已完成"]];
    _segment.frame = CGRectMake(0, 0, SCREEN_WIDTH, 35);
    [_segment addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    _segment.selectedSegmentIndex = 0;
    [self.view addSubview:_segment];
}
- (void)segmentAction:(UISegmentedControl *)setment{
    if (setment.selectedSegmentIndex == 0) {
        [self initForOneData];
        [_scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }else if (setment.selectedSegmentIndex == 1){
        [self initForTwoData];
        [_scrollView setContentOffset:CGPointMake(SCREEN_WIDTH, 0) animated:YES];
    }else if(setment.selectedSegmentIndex == 2){
        
    }
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
    _scrollView.bounces = NO;
    [self.view addSubview:_scrollView];
}

#pragma mark
#pragma mark ========== 设置第一个tableview
- (void)initForOneTableView{
    _oneTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, _scrollView.height) style:UITableViewStyleGrouped];
    _oneTableView.showsHorizontalScrollIndicator = NO;
    _oneTableView.showsVerticalScrollIndicator = NO;
    _oneTableView.delegate = self;
    _oneTableView.dataSource = self;
    _oneTableView.tag = 1000;
    [_scrollView addSubview:_oneTableView];
    _oneCellHeight = [NSMutableArray array];
    
    __weak typeof(self)myself = self;
    _timer = [NSTimer scheduledTimerWithTimeInterval:30 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [myself initForOneData];
    }];
    
    _oneTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [myself initForOneData];
    }];
}

#pragma mark
#pragma mark ========== 设置第二个tableview
- (void)initForTwoTableView{
    _twoTableView = [[UITableView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, _scrollView.height) style:UITableViewStyleGrouped];
    _twoTableView.showsHorizontalScrollIndicator = NO;
    _twoTableView.showsVerticalScrollIndicator = NO;
    _twoTableView.delegate = self;
    _twoTableView.dataSource = self;
    _twoTableView.tag = 1001;
    [_scrollView addSubview:_twoTableView];
    
    __weak typeof(self)myself = self;
    _twoTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [myself initForTwoData];
    }];
}

#pragma mark
#pragma mark ========== 请求第一个数据
- (void)initForOneData{
    _oneDataList = [NSMutableArray array];
    _oneCellHeight = [NSMutableArray array];
    __weak typeof(self)myself = self;
    //1.先查询商家的id
    AVQuery * query = [AVQuery queryWithClassName:@"Merchants"];
    [query whereKey:@"owner" equalTo:[AVUser currentUser]];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if (objects.count > 0) {
            ZZQMerchants * merchant = [[ZZQMerchants alloc] init];
            merchant = [merchant setMerchantDetail:objects[0]];
            //2.查询总订单，通过商家id查询
            AVQuery * orderQuery1 = [AVQuery queryWithClassName:@"Orders"];
            [orderQuery1 whereKey:@"merchantId" equalTo:merchant.objId];
            AVQuery * orderQuery2 = [AVQuery queryWithClassName:@"Orders"];
            [orderQuery2 whereKey:@"orderStatus" equalTo:@"已支付"];
            AVQuery * orderQuery = [AVQuery andQueryWithSubqueries:[NSArray arrayWithObjects:orderQuery1, orderQuery2, nil]];
            [orderQuery findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
                if (objects.count > 0) {
                    for (AVObject * obj in objects) {
                        ZZQOrders * order = [[ZZQOrders alloc] init];
                        order = [order setOrdersForObj:obj];
                        [myself.oneDataList addObject:order];
                        __weak typeof(self)myself = self;
                        __block NSInteger count = objects.count;
                        AVQuery * query = [AVQuery queryWithClassName:@"OrderTemp"];
                        [query whereKey:@"ordersID" equalTo:order.objId];
                        [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
                            if (objects.count > 0) {
                                NSString * str = @"";
                                for (AVObject * obj in objects) {
                                    ZZQOrderTemp * temp = [[ZZQOrderTemp alloc] init];
                                    temp = [temp setOrderTempForObj:obj];
                                    str = [str stringByAppendingString:[NSString stringWithFormat:@"%@ x%@\n", temp.menuName, temp.menuNum]];
                                }
                                double height = [myself rowHeightByString:str font:[UIFont systemFontOfSize:12] width:SCREEN_WIDTH-30];
                                [myself.oneCellHeight addObject:@(height)];
                                if (myself.oneCellHeight.count == count) {
                                    [myself.oneTableView reloadData];
                                }
                            }
                        }];
                    }
                    [myself.oneTableView reloadData];
                }
                [myself.oneTableView.mj_header endRefreshing];
            }];
        }
    }];
}

#pragma mark
#pragma mark ========== 请求第二个数据
- (void)initForTwoData{
    _twoDataList = [NSMutableArray array];
    __weak typeof(self)myself = self;
    //1.先查询商家的id
    AVQuery * query = [AVQuery queryWithClassName:@"Merchants"];
    [query whereKey:@"owner" equalTo:[AVUser currentUser]];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if (objects.count > 0) {
            ZZQMerchants * merchant = [[ZZQMerchants alloc] init];
            merchant = [merchant setMerchantDetail:objects[0]];
            //2.查询总订单，通过商家id查询
            AVQuery * orderQuery1 = [AVQuery queryWithClassName:@"Orders"];
            [orderQuery1 whereKey:@"merchantId" equalTo:merchant.objId];
            AVQuery * orderQuery2 = [AVQuery queryWithClassName:@"Orders"];
            [orderQuery2 whereKey:@"orderStatus" equalTo:@"已接单"];
            AVQuery * orderQuery = [AVQuery andQueryWithSubqueries:[NSArray arrayWithObjects:orderQuery1, orderQuery2, nil]];
            [orderQuery findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
                if (objects.count > 0) {
                    for (AVObject * obj in objects) {
                        ZZQOrders * order = [[ZZQOrders alloc] init];
                        order = [order setOrdersForObj:obj];
                        [myself.twoDataList addObject:order];
                    }
                    [myself.twoTableView reloadData];
                }
                [myself.twoTableView.mj_header endRefreshing];
            }];
        }
    }];
}

#pragma mark
#pragma mark ========== 代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView.tag == 1000) {
        return _oneDataList.count;
    }else if (tableView.tag == 1001){
        return _twoDataList.count;
    }else{
        return 1;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    __weak typeof(self)myself = self;
    if (tableView.tag == 1000) {
        _oneCell = [tableView dequeueReusableCellWithIdentifier:ONE_CELL_ID];
        if (_oneCell == nil) {
            _oneCell = [[ZZQOrdersTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ONE_CELL_ID];
        }
        [_oneCell setOrderModle:_oneDataList[indexPath.row] indexPath:indexPath];
        [_oneCell setSelectionStyle:UITableViewCellSelectionStyleNone];
        [_oneCell setBtnBlock:^(NSString * btnTitle, NSIndexPath * index) {
            [myself.oneDataList removeObjectAtIndex:index.row];
            [myself.oneTableView reloadData];
        }];
        return _oneCell;
    }else if (tableView.tag == 1001){
        _twoCell = [tableView dequeueReusableCellWithIdentifier:TWO_CELL_ID];
        if (_twoCell == nil) {
            _twoCell = [[ZZQRecOrdersTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:TWO_CELL_ID];
        }
        [_twoCell setSelectionStyle:UITableViewCellSelectionStyleNone];
        [_twoCell setOrderModle:_twoDataList[indexPath.row]];
        return _twoCell;
    }else{
        return  nil;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag == 1000) {
        if (_oneCellHeight.count > 0) {
            return [_oneCellHeight[indexPath.row] doubleValue] + 120;
        }else{
            return 100;
        }
    }else if (tableView.tag == 1001){
        return 100;
    }else{
        return 100;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView clearSelectedRowsAnimated:YES];
}


//工具，自动计算高度
-(float)rowHeightByString:(NSString *)content font:(UIFont *)font width:(CGFloat)width{
    CGSize mySize = CGSizeMake(width, CGFLOAT_MAX);
    CGSize size = [content boundingRectWithSize:mySize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    return size.height;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
