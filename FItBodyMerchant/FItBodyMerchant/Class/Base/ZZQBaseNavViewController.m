//
//  ZZQBaseNavViewController.m
//  FItBodyUser
//
//  Created by ben on 17/3/11.
//  Copyright © 2017年 张增强. All rights reserved.
//

#import "ZZQBaseNavViewController.h"

@interface ZZQBaseNavViewController ()

@end

@implementation ZZQBaseNavViewController

+ (void)initialize{
//    UINavigationBar *bar = [UINavigationBar appearance];
//    [bar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
//    [bar setShadowImage:[UIImage new]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setBackgroundColor:[UIColor colorWithRed:0.03 green:0.76 blue:0.67 alpha:1.00]];
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    [super pushViewController:viewController animated:animated];
    if(self.childViewControllers.count>1){
        UIButton * backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 33, 33)];
        [backBtn setImage:[UIImage imageNamed:@"icon_account_navigationBar_back"] forState:UIControlStateNormal];
        [backBtn setImage:[UIImage imageNamed:@"icon_account_navigationBar_back"] forState:UIControlStateHighlighted];
        [backBtn addTarget:self action:@selector(backAction:vc:) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem * backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
        viewController.navigationItem.leftBarButtonItem = backItem;
        [viewController.navigationController.navigationBar.backItem setHidesBackButton:YES];
    }
}

- (void)backAction:(UIButton *)btn vc:(UIViewController *)vc{
    [self popViewControllerAnimated:YES];
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
