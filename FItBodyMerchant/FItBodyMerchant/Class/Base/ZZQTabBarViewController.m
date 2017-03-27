//
//  ZZQTabBarViewController.m
//  FItBodyUser
//
//  Created by ben on 17/3/11.
//  Copyright © 2017年 张增强. All rights reserved.
//

#import "ZZQTabBarViewController.h"
#import "ZZQBaseNavViewController.h"
#import "ZZQBaseTabBar.h"
#import "ZZQBaseViewController.h"

@interface ZZQTabBarViewController ()<ZZQTabBarDelegate>

/**
 * 设置tabbar的控制器
 */
@property(nonatomic, strong)NSArray * controllerArray;
/**
 * 设置tabBar内容
 */
@property(nonatomic, strong)ZZQBaseTabBar * zzqTabBar;

@end

@implementation ZZQTabBarViewController

#pragma 
#pragma ============== 懒加载

- (ZZQBaseTabBar *)zzqTabBar{
    if(!_zzqTabBar){
        _zzqTabBar = [[ZZQBaseTabBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 49)];
        _zzqTabBar.delegate = self;
    }
    return _zzqTabBar;
}

- (NSArray *)controllerArray{
    if(!_controllerArray){
        _controllerArray = [NSArray arrayWithObjects:@"ZZQHomeViewController", @"ZZQOrderViewController", @"ZZQMeViewController", nil];
    }
    return _controllerArray;
}

#pragma 
#pragma ============== 设置
- (void)viewDidLoad {
    [super viewDidLoad];
    //设置controllers
    [self initControllers];
    //设置tabbar样式
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[UIImage new]];
    [self.tabBar addSubview:self.zzqTabBar];
}

- (void)initControllers{
    NSMutableArray * controllers = [NSMutableArray array];
    for(NSUInteger i = 0; i < self.controllerArray.count; i++){
        ZZQBaseViewController * VC = [[NSClassFromString(self.controllerArray[i]) alloc] init];
        ZZQBaseNavViewController * NVC = [[ZZQBaseNavViewController alloc] initWithRootViewController:VC];
        [controllers addObject:NVC];
    }
    self.viewControllers = controllers;
}

#pragma 
#pragma ============= 代理
- (void)zzqTabBar:(ZZQBaseTabBar *)tabBar clickButton:(ZZQItemType)idx{
    self.selectedIndex = idx - ZZQItemTypeHOME;
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
